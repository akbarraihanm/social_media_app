import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class UserDetailRepository {
  Future<Resource<UserDetailEntity>> getDetail(String id);
  Future<Resource<UserPostEntity>> getUserPost(String id, [int? page]);
}