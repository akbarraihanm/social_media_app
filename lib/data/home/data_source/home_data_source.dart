import 'package:social_media_app/data/home/api/home_service.dart';
import 'package:social_media_app/data/home/models/user_response.dart';

abstract class HomeDataSource {
  Future<UserResponse> getUsers(int page);
}

class HomeDataSourceImpl implements HomeDataSource {
  final HomeService service;

  HomeDataSourceImpl(this.service);

  @override
  Future<UserResponse> getUsers(int page) {
    return service.getUser(page);
  }

}