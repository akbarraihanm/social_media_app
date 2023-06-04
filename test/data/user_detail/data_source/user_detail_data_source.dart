import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/user_detail/services/user_detail_api_service.dart';
import 'package:social_media_app/data/user_detail/data_source/user_detail_data_source.dart';
import 'package:social_media_app/data/user_detail/models/user_detail_data.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

class MockUserDetailService extends Mock implements UserDetailApiService {}

void main() {
  late MockUserDetailService service;
  late UserDetailDataSource dataSource;

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
    service = MockUserDetailService();
    dataSource = UserDetailDataSourceImpl(service);
  });

  group('UserDetailDataSource test', () {
    test(
        'Given UserDetailDataSource, '
        'When get user detail success, '
        'Then it should return correct data', () async {
      when(() => service.getUserDetail('id')).thenAnswer((_) async => userDetail);

      final result = await dataSource.getDetail('id');
      expect(result.toJson(), userDetail.toJson());
    });

    test(
        'Given UserDetailDataSource, '
        'When get user post success, '
        'Then it should return correct data', () async {
      when(() => service.getUserPost('id', 0)).thenAnswer((_) async => userPost);

      final result = await dataSource.getUserPost('id', 0);
      expect(result.toJson(), userPost.toJson());
    });
  });
}