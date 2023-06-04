import 'dart:convert';

import 'package:social_media_app/core/network/api_exception.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/data/home/data_source/home_data_source.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/home/mapper.dart';
import 'package:social_media_app/domain/home/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<Resource<UserEntity>> getUsers(int page) async {
    try {
      final data = await dataSource.getUsers(page);
      return Resource.success(data.toEntity());
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(message["message"]);
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }
}