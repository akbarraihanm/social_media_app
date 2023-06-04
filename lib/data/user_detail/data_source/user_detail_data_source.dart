import 'package:social_media_app/data/user_detail/services/user_detail_api_service.dart';
import 'package:social_media_app/data/user_detail/models/user_detail_data.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

abstract class UserDetailDataSource {
  Future<UserDetailData> getDetail(String id);
  Future<UserPostResponse> getUserPost(String id, [int? page = 0]);
}

class UserDetailDataSourceImpl implements UserDetailDataSource {
  final UserDetailApiService service;

  UserDetailDataSourceImpl(this.service);

  @override
  Future<UserDetailData> getDetail(String id) {
    return service.getUserDetail(id);
  }

  @override
  Future<UserPostResponse> getUserPost(String id, [int? page = 0]) {
    return service.getUserPost(id, page);
  }

}