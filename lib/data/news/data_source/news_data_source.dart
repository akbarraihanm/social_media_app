import 'package:social_media_app/data/news/service/news_service.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

abstract class NewsDataSource {
  Future<UserPostResponse> getPost([int? page = 0]);
  Future<UserPostResponse> getByTag(String tag, [int? page = 0]);
}

class NewsDataSourceImpl implements NewsDataSource {
  final NewsService service;

  NewsDataSourceImpl(this.service);

  @override
  Future<UserPostResponse> getByTag(String tag, [int? page = 0]) {
    return service.getByTag(tag, page);
  }

  @override
  Future<UserPostResponse> getPost([int? page = 0]) {
    return service.getPost(page);
  }

}