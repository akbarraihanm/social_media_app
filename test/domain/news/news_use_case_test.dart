import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/news/repository/news_repository.dart';
import 'package:social_media_app/domain/news/use_case/news_use_case.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late MockNewsRepository repository;
  late NewsUseCase useCase;

  final data = UserPostEntity(
    data: [],
    total: 0,
    page: 0,
    limit: 0,
  );

  setUpAll(() {
    repository = MockNewsRepository();
    useCase = NewsUseCase(repository);
  });

  group('NewsUseCase test', () {
    test(
        'Given NewsUseCase, '
        'When get posts success, '
        'Then it should return correct list', () async {
          final success = Resource.success(data);
      when(() => repository.getPost(0)).thenAnswer((_) async => success);

      final result = await useCase.getPosts(0);
      expect(result.data?.data, success.data?.data);
      expect(result.data?.limit, success.data?.limit);
      expect(result.data?.page, success.data?.page);
    });

    test(
        'Given NewsUseCase, '
        'When get by tags success, '
        'Then it should return correct list', () async {
      final success = Resource.success(data);
      when(() => repository.getByTags('tag', 0)).thenAnswer((_) async => success);

      final result = await useCase.getByTags('tag', 0);
      expect(result.data?.data, success.data?.data);
      expect(result.data?.limit, success.data?.limit);
      expect(result.data?.page, success.data?.page);
    });
  });
}
