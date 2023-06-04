import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/data/home/api/home_service.dart';
import 'package:social_media_app/data/home/data_source/home_data_source.dart';
import 'package:social_media_app/data/home/models/user_response.dart';

class MockHomeService extends Mock implements HomeService {}

void main() {
  late HomeService service;
  late HomeDataSource dataSource;

  final data = UserResponse.fromJsonMap({
    'data': [
      UserData.fromJsonMap({
        'id': 'id',
        'title': 'title',
        'firstName': 'firstName',
        'lastName': 'lastName',
        'picture': 'picture',
      }).toJson(),
    ],
    'total': 0,
    'page': 0,
    'limit': 0,
  });

  setUpAll(() {
    service = MockHomeService();
    dataSource = HomeDataSourceImpl(service);
  });

  group('HomeDataSource test', () {
    test(
        'Given HomeDataSource, '
        'When get users success, '
        'Then it should return correct list', () async {
      when(() => service.getUser(0)).thenAnswer((_) async => data);

      final result = await dataSource.getUsers(0);
      expect(result.toJson(), data.toJson());
    });
  });
}