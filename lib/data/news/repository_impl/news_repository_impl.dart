import 'dart:convert';

import 'package:social_media_app/core/network/api_exception.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/data/news/data_source/news_data_source.dart';
import 'package:social_media_app/domain/news/repository/news_repository.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/mapper.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;

  NewsRepositoryImpl(this.dataSource);

  @override
  Future<Resource<UserPostEntity>> getByTags(String tag, [int? page = 0]) async {
    try {
      final data = await dataSource.getByTag(tag, page);
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
  Future<Resource<UserPostEntity>> getPost([int? page = 0]) async {
    try {
      final data = await dataSource.getPost(page);
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