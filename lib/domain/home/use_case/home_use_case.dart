import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/home/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase(this.repository);

  Future<Resource<UserEntity>> getUsers(int page) {
    return repository.getUsers(page);
  }
}