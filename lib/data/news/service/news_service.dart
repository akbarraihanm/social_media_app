import 'package:social_media_app/core/network/http_helper.dart';
import 'package:social_media_app/core/network/url_helper.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

class NewsService extends HttpHelper {
  Future<UserPostResponse> getPost([int? page = 0]) async {
    final map = await getMethod(URL.news(page), appIdHeader);
    return UserPostResponse.fromJsonMap(map);
  }

  Future<UserPostResponse> getByTag(String tag, [int? page = 0]) async {
    final map = await getMethod(URL.newsByTag(tag, page), appIdHeader);
    return UserPostResponse.fromJsonMap(map);
  }
}