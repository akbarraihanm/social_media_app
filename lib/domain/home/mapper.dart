import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';

extension UserDataToEntity on UserData {
  DataUserEntity toEntity() => DataUserEntity(
    id: id ?? "",
    title: title ?? "",
    firstName: firstName ?? "",
    lastName: lastName ?? "",
    picture: picture ?? "",
  );
}

extension UserToEntity on UserResponse {
  UserEntity toEntity() => UserEntity(
    data: data?.map((e) => e.toEntity()).toList() ?? [],
    total: total ?? 0,
    page: page ?? 0,
    limit: limit ?? 0,
  );
}