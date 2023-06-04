import 'package:hive/hive.dart';

part 'user_entity.g.dart';

class UserEntity {
  final List<DataUserEntity> data;
  final int total;
  final int page;
  final int limit;

  UserEntity({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });
}

@HiveType(typeId: 0)
class DataUserEntity extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final String picture;

  DataUserEntity({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });
}
