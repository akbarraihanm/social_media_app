import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_local_repository.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_repository.dart';

class UserDetailUseCase {
  final UserDetailRepository repository;
  final UserDetailLocalRepository localRepository;

  UserDetailUseCase(this.repository, this.localRepository);

  Future<Resource<UserDetailEntity>> getDetail(String id) {
    return repository.getDetail(id);
  }

  Future<Resource<UserPostEntity>> getUserPost(String id, [int? page = 0]) {
    return repository.getUserPost(id, page);
  }

  Future<Resource<List<DataUserEntity>>> getFriends() {
    return localRepository.getFriends();
  }

  Future addFriend(DataUserEntity data) {
    return localRepository.addFriend(data);
  }

  Future deleteFriend(DataUserEntity data) {
    return localRepository.deleteFriend(data);
  }

  Future<Resource<List<DataUserPost>>> getLikes() {
    return localRepository.getLikes();
  }

  Future like(DataUserPost data) {
    return localRepository.like(data);
  }

  Future unlike(DataUserPost data) {
    return localRepository.unlike(data);
  }
}