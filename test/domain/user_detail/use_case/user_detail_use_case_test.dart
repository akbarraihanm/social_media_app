import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_local_repository.dart';
import 'package:social_media_app/domain/user_detail/repository/user_detail_repository.dart';
import 'package:social_media_app/domain/user_detail/use_case/user_detail_use_case.dart';

class MockUserDetailRepository extends Mock implements UserDetailRepository {}
class MockUserDetailLocalRepository extends Mock implements UserDetailLocalRepository {}

void main() {
  late MockUserDetailRepository repository;
  late MockUserDetailLocalRepository localRepository;
  late UserDetailUseCase useCase;

  final userDetail = UserDetailEntity(
    id: 'id',
    title: 'title',
    firstName: 'firstName',
    lastName: 'lastName',
    picture: 'picture',
    gender: 'gender',
    email: 'email',
    dateOfBirth: 'dateOfBirth',
    phone: 'phone',
    location: UserLocationEntity(
      street: 'street',
      city: 'city',
      state: 'state',
      country: 'country',
      timezone: 'timezone',
    ),
    registerDate: 'registerDate',
    updatedDate: 'updatedDate',
  );

  final userPost = UserPostEntity(
    data: <DataUserPost>[],
    total: 0,
    page: 0,
    limit: 0,
  );

  setUpAll(() {
    repository = MockUserDetailRepository();
    localRepository = MockUserDetailLocalRepository();
    useCase = UserDetailUseCase(repository, localRepository);
  });

  group('UserDetailUseCase test', () {
    test(
        'Given UserDetailUseCase, '
        'When get user detail success, '
        'Then it should return correct data', () async {
          final success = Resource.success(userDetail);
      when(() => repository.getDetail('id')).thenAnswer((_) async => success);

      final result = await useCase.getDetail('id');
      expect(result.data, success.data);
    });

    test(
        'Given UserDetailUseCase, '
        'When get user post success, '
        'Then it should return correct data', () async {
          final success = Resource.success(userPost);
      when(() => repository.getUserPost('id', 0)).thenAnswer((_) async => success);

      final result = await useCase.getUserPost('id', 0);
      expect(result.data, success.data);
    });
  });
}
