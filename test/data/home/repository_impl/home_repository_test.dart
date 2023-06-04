import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/data/home/data_source/home_data_source.dart';
import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/home/repository_impl/home_repository_impl.dart';
import 'package:social_media_app/domain/home/mapper.dart';
import 'package:social_media_app/domain/home/repository/home_repository.dart';

class MockHomeDataSource extends Mock implements HomeDataSource {}

void main() {
  late MockHomeDataSource dataSource;
  late HomeRepository repository;

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
    dataSource = MockHomeDataSource();
    repository = HomeRepositoryImpl(dataSource);
  });

  group('HomeRepository test', () {
    test(
        'Given HomeRepository, '
        'When get user success, '
        'Then it should return correct list', () async {
      when(() => dataSource.getUsers(0)).thenAnswer((_) async => data);

      final result = await repository.getUsers(0);
      expect(result.data?.data.first.id, data.toEntity().data.first.id);
    });
  });
}