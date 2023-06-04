import 'package:social_media_app/core/network/http_helper.dart';
import 'package:social_media_app/core/network/url_helper.dart';
import 'package:social_media_app/data/home/models/user_response.dart';

class HomeService extends HttpHelper {
  Future<UserResponse> getUser(int page) async {
    final map = await getMethod(URL.users(page), appIdHeader);
    return UserResponse.fromJsonMap(map);
  }
}