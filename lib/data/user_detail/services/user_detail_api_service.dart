import 'package:social_media_app/core/network/http_helper.dart';
import 'package:social_media_app/core/network/url_helper.dart';
import 'package:social_media_app/data/user_detail/models/user_detail_data.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

class UserDetailApiService extends HttpHelper {
  Future<UserDetailData> getUserDetail(String id) async {
    final map = await getMethod(URL.userDetail(id), appIdHeader);
    return UserDetailData.fromJsonMap(map);
  }

  Future<UserPostResponse> getUserPost(String id, [int? page = 0]) async {
    final map = await getMethod(URL.userPost(id, page), appIdHeader);
    return UserPostResponse.fromJsonMap(map);
  }
}