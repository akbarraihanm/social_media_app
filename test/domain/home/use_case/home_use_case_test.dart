import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/home/repository/home_repository.dart';
import 'package:social_media_app/domain/home/use_case/home_use_case.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository repository;
  late HomeUseCase useCase;

  setUpAll(() {
    repository = MockHomeRepository();
    useCase = HomeUseCase(repository);
  });

  final data = UserEntity(data: [], total: 0, page: 0, limit: 0);

  group('HomeUseCase test', () {
    test(
        'Given HomeUseCase, '
        'When get user success,'
        'Then it should return correct data', () async {
      when(() => repository.getUsers(0)).thenAnswer((invocation) async => Resource.success(data));

      final result = await useCase.getUsers(0);
      expect(result.data, Resource.success(data).data);
    });
  });
}