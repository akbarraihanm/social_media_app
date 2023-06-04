import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/user_detail/models/user_detail_data.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';
import 'package:social_media_app/domain/home/mapper.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

/// User Detail Entity mapper
extension UserLocationToEntity on UserLocation {
  UserLocationEntity toEntity() => UserLocationEntity(
    street: street ?? '',
    city: city ?? '',
    state: state ?? '',
    country: country ?? '',
    timezone: timezone ?? '',
  );
}

extension UserDetailToEntity on UserDetailData {
  UserDetailEntity toEntity() => UserDetailEntity(
    id: id ?? "",
    title: title ?? "",
    firstName: firstName ?? "",
    lastName: lastName ?? "",
    picture: picture ?? "",
    gender: gender ?? "",
    email: email ?? "",
    dateOfBirth: dateOfBirth ?? "",
    phone: phone ?? "",
    location: location?.toEntity() ?? UserLocation.fromJsonMap({}).toEntity(),
    registerDate: registerDate ?? "",
    updatedDate: updatedDate ?? "",
  );
}

/// User Post Entity mapper
extension DataUserPostToEntity on UserPostData {
  DataUserPost toEntity() => DataUserPost(
    id: id ?? "",
    image: image ?? "",
    likes: likes ?? 0,
    tags: tags ?? <String>[],
    text: text ?? "",
    publishDate: publishDate ?? "",
    owner: owner?.toEntity() ?? UserData.fromJsonMap({}).toEntity(),
  );
}

extension UserPostToEntity on UserPostResponse {
  UserPostEntity toEntity() => UserPostEntity(
    data: data?.map((e) => e.toEntity()).toList() ?? <DataUserPost>[],
    total: total ?? 0,
    page: page ?? 0,
    limit: limit ?? 0,
  );
}