import 'dart:convert';

import 'package:social_media_app/core/network/api_exception.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/data/user_detail/data_source/user_detail_data_source.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/mapper.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_repository.dart';

class UserDetailRepositoryImpl implements UserDetailRepository {
  final UserDetailDataSource dataSource;

  UserDetailRepositoryImpl(this.dataSource);

  @override
  Future<Resource<UserDetailEntity>> getDetail(String id) async {
    try {
      final data = await dataSource.getDetail(id);
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

  @override
  Future<Resource<UserPostEntity>> getUserPost(String id, [int? page]) async {
    try {
      final data = await dataSource.getUserPost(id, page);
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