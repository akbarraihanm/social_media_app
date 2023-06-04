import 'package:social_media_app/data/user_detail/services/user_detail_local_service.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class UserDetailLocalDataSource {
  Future<List<DataUserEntity>> getFriends();
  Future addFriend(DataUserEntity data);
  Future deleteFriend(DataUserEntity data);
  Future<List<DataUserPost>> getLikes();
  Future like(DataUserPost data);
  Future unlike(DataUserPost data);
}

class UserDetailLocalDataSourceImpl implements UserDetailLocalDataSource {
  final UserDetailLocalService service;

  UserDetailLocalDataSourceImpl(this.service);

  @override
  Future addFriend(DataUserEntity data) {
    return service.addFriend(data);
  }

  @override
  Future deleteFriend(DataUserEntity data) {
    return service.deleteFriend(data);
  }

  @override
  Future<List<DataUserEntity>> getFriends() {
    return service.getFriends();
  }

  @override
  Future<List<DataUserPost>> getLikes() {
    return service.getLikes();
  }

  @override
  Future like(DataUserPost data) {
    return service.like(data);
  }

  @override
  Future unlike(DataUserPost data) {
    return service.unlike(data);
  }

}