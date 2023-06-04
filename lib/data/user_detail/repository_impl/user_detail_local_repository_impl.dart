import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/data/user_detail/data_source/user_detail_local_data_source.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_local_repository.dart';

class UserDetailLocalRepositoryImpl implements UserDetailLocalRepository {
  final UserDetailLocalDataSource dataSource;

  UserDetailLocalRepositoryImpl(this.dataSource);

  @override
  Future addFriend(DataUserEntity data) async {
    try {
      final result = await dataSource.addFriend(data);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("Can't add a friend. Please try again");
    }
  }

  @override
  Future deleteFriend(DataUserEntity data) async {
    try {
      final result = await dataSource.deleteFriend(data);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("Can't delete a friend. Please try again");
    }
  }

  @override
  Future<Resource<List<DataUserEntity>>> getFriends() async {
    try {
      final result = await dataSource.getFriends();
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("Oops, something went wrong.");
    }
  }

  @override
  Future<Resource<List<DataUserPost>>> getLikes() async {
    try {
      final result = await dataSource.getLikes();
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("Oops, something went wrong.");
    }
  }

  @override
  Future like(DataUserPost data) async {
    try {
      final result = await dataSource.like(data);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("Can't like a post. Please try again");
    }
  }

  @override
  Future unlike(DataUserPost data) async {
    try {
      final result = await dataSource.unlike(data);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("Can't unlike a post. Please try again");
    }
  }

}