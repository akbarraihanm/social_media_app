import 'package:hive/hive.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';

part 'user_post_entity.g.dart';

class UserPostEntity {
  final List<DataUserPost> data;
  final int total;
  final int page;
  final int limit;

  UserPostEntity({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });
}

@HiveType(typeId: 1)
class DataUserPost extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final int likes;
  @HiveField(3)
  final List<String> tags;
  @HiveField(4)
  final String text;
  @HiveField(5)
  final String publishDate;
  @HiveField(6)
  final DataUserEntity owner;

  DataUserPost({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    required this.owner,
  });
}