import 'package:hive/hive.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

class UserDetailLocalService {
  final _friendBox = locator<Box<DataUserEntity>>();
  final _postBox = locator<Box<DataUserPost>>();

  Future<List<DataUserEntity>> getFriends() async {
    return _friendBox.values.toList();
  }

  Future addFriend(DataUserEntity data) async {
    return _friendBox.put(data.id, data);
  }

  Future deleteFriend(DataUserEntity data) async {
    return _friendBox.delete(data.id);
  }

  Future<List<DataUserPost>> getLikes() async {
    return _postBox.values.toList();
  }

  Future like(DataUserPost data) async {
    return _postBox.put(data.id, data);
  }

  Future unlike(DataUserPost data) async {
    return _postBox.delete(data.id);
  }
}