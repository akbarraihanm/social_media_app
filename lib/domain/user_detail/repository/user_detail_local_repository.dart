import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class UserDetailLocalRepository {
  Future<Resource<List<DataUserEntity>>> getFriends();
  Future addFriend(DataUserEntity data);
  Future deleteFriend(DataUserEntity data);
  Future<Resource<List<DataUserPost>>> getLikes();
  Future like(DataUserPost data);
  Future unlike(DataUserPost data);
}