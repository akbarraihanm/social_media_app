import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';

abstract class HomeRepository {
  Future<Resource<UserEntity>> getUsers(int page);
}