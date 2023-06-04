import 'dart:convert';
import 'dart:io';

import 'package:alice/core/alice_http_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_app/di/di_object.dart';

import 'api_exception.dart';

class HttpHelper {

  Map<String, String> get appIdHeader => {
    "app-id": "647831b847935902d5444463",
  };

  Future<dynamic> getMethod(String endpoint,
      [Map<String, String>? header]) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(endpoint), headers: header)
          .interceptWithAlice(AppLocator.alice);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> postMethod(String endpoint,
      {dynamic body, Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      header?['Content-Type'] = "application/json";

      final response = await http.post(
        Uri.parse(endpoint),
        body: jsonEncode(body),
        headers: header,
      ).interceptWithAlice(AppLocator.alice, body: body);

      responseJson = _returnResponse(response);

    } on SocketException {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> putMethod(String endpoint,
      {dynamic body, Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      header?['Content-Type'] = "application/json";

      final response = await http.put(
        Uri.parse(endpoint),
        body: jsonEncode(body),
        headers: header,
      ).interceptWithAlice(AppLocator.alice, body: body);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> patchMethod(String endpoint,
      {dynamic body, Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      header?['Content-Type'] = "application/json";

      final response = await http.patch(
        Uri.parse(endpoint),
        body: jsonEncode(body),
        headers: header,
      ).interceptWithAlice(AppLocator.alice, body: body);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> deleteMethod(String endpoint,
      {Map<String, String>? header}) async {
    dynamic responseJson;
    try {
      final response = await http
          .delete(Uri.parse(endpoint))
          .interceptWithAlice(AppLocator.alice);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> multipartPost(String endpoint,
      {Map<String, String>? body,
        Map<String, String>? header,
        Map<String, File>? files}) async {
    dynamic responseJson;
    try {
      var uri = Uri.parse(endpoint);
      var request = http.MultipartRequest("POST", uri);

      if (files != null) {
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path));
        });
      }

      if (header != null) {
        request.headers.addAll(header);
      }
      if (body != null) {
        request.fields.addAll(body);
      }

      var response = await request.send()
          .then(http.Response.fromStream)
          .interceptWithAlice(AppLocator.alice, body: body);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException();
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var result = json.decode(response.body);
        return result;
      case 201:
        var result = json.decode(response.body);
        return result;
      case 401:
        throw UnauthorizedException(errorBody: response.body);
      case 500:
        throw ErrorRequestException(errorBody: jsonEncode({
          "message": "Oops, there is an error. Please try again."
        }), errorCode: 500);
      default:
        throw ErrorRequestException(
          errorBody: response.body,
          errorCode: response.statusCode,
        );
    }
  }
}
