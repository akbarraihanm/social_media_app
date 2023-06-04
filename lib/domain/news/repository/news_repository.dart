import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class NewsRepository {
  Future<Resource<UserPostEntity>> getPost([int? page = 0]);
  Future<Resource<UserPostEntity>> getByTags(String tag, [int? page = 0]);
}