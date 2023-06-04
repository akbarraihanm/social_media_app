import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/user_detail/data_source/user_detail_data_source.dart';
import 'package:social_media_app/data/user_detail/models/user_detail_data.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';
import 'package:social_media_app/data/user_detail/repository_impl/user_detail_repository_impl.dart';
import 'package:social_media_app/domain/user_detail/mapper.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_repository.dart';

class MockUserDetailDataSource extends Mock implements UserDetailDataSource {}

void main() {
  late MockUserDetailDataSource dataSource;
  late UserDetailRepository repository;

  final userDetail = UserDetailData.fromJsonMap({
    'id': 'id',
    'title': 'title',
    'firstName': 'firstName',
    'lastName': 'lastName',
    'picture': 'picture',
    'gender': 'gender',
    'email': 'email',
    'dateOfBirth': 'dateOfBirth',
    'phone': 'phone',
    'location': UserLocation.fromJsonMap({
      'street': 'street',
      'city': 'city',
      'state': 'state',
      'country': 'country',
      'timezone': 'timezone',
    }).toJson(),
    'registerDate': 'registerDate',
    'updatedDate': 'updatedDate',
  });

  final userPost = UserPostResponse.fromJsonMap({
    'data': [
      UserPostData.fromJsonMap({
        'id': 'id',
        'image': 'image',
        'likes': 0,
        'tags': <String>[],
        'text': 'text',
        'publishDate': 'publishDate',
        'owner': UserData.fromJsonMap({
          'id': 'id',
          'title': 'title',
          'firstName': 'firstName',
          'lastName': 'lastName',
          'picture': 'picture',
        }).toJson(),
      }).toJson(),
    ],
    'total': 0,
    'page': 0,
    'limit': 0,
  });

  setUpAll(() {
    dataSource = MockUserDetailDataSource();
    repository = UserDetailRepositoryImpl(dataSource);
  });

  group('UserDetailRepository test', () {
    test(
        'Given UserDetailRepository, '
        'When get user detail success, '
        'Then it should return correct data', () async {
      when(() => dataSource.getDetail('id')).thenAnswer((_) async => userDetail);

      final result = await repository.getDetail('id');
      expect(result.data?.id, userDetail.toEntity().id);
      expect(result.data?.location.city, userDetail.toEntity().location.city);
    });

    test(
        'Given UserDetailRepository, '
        'When get user post success, '
        'Then it should return correct list', () async {
      when(() => dataSource.getUserPost('id', 0)).thenAnswer((_) async => userPost);

      final result = await repository.getUserPost('id', 0);
      expect(result.data?.limit, userPost.toEntity().limit);
      expect(result.data?.page, userPost.toEntity().page);
      expect(result.data?.total, userPost.toEntity().total);
      expect(result.data?.data.first.id, userPost.toEntity().data.first.id);
    });
  });
}