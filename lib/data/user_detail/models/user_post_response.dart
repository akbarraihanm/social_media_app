import 'package:social_media_app/core/extensions/string_extension.dart';
import 'package:social_media_app/data/home/models/user_response.dart';

class UserPostResponse {
  List<UserPostData>? data;
  int? total;
  int? page;
  int? limit;

  UserPostResponse.fromJsonMap(Map<String, dynamic> map) {
    data = map['data'] == null? []: List.from(map['data']
        .map((it) => UserPostData.fromJsonMap(it)));
    total = map['total'];
    page = map['page'];
    limit = map['limit'];
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'total': total,
    'page': page,
    'limit': limit,
  };
}

class UserPostData {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  UserData? owner;

  UserPostData.fromJsonMap(Map<String, dynamic> map) {
    id = map['id'];
    image = map['image'];
    likes = map['likes'];
    tags = map['tags'] == null? []: List.from(map['tags'].map((it) => it));
    text = map['text'];
    publishDate = map['publishDate'] ?? "";
    publishDate = publishDate?.toDayMonthYear() ?? "";
    owner = map['owner'] == null? null: UserData.fromJsonMap(map['owner']);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    'likes': likes,
    'tags': tags,
    'text': text,
    'publishDate': publishDate,
    'owner': owner?.toJson(),
  };
}