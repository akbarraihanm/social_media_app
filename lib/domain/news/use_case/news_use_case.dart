import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/news/repository/news_repository.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

class NewsUseCase {
  final NewsRepository repository;

  NewsUseCase(this.repository);

  Future<Resource<UserPostEntity>> getPosts([int? page = 0]) {
    return repository.getPost(page);
  }

  Future<Resource<UserPostEntity>> getByTags(String tag, [int? page = 0]) {
    return repository.getByTags(tag, page);
  }
}