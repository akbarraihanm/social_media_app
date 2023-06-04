import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/news/data_source/news_data_source.dart';
import 'package:social_media_app/data/news/repository_impl/news_repository_impl.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';
import 'package:social_media_app/domain/news/repository/news_repository.dart';
import 'package:social_media_app/domain/user_detail/mapper.dart';

class MockNewsDataSource extends Mock implements NewsDataSource {}

void main() {
  late MockNewsDataSource dataSource;
  late NewsRepository repository;

  final data = UserPostResponse.fromJsonMap({
    'data': [
      UserPostData.fromJsonMap({
        'id': 'id',
        'image': 'image',
        'likes': 0,
        'tags': <String>[],
        'text': 'text',
        'publishDate': '2000-01-01T00:00:00.000Z',
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
    dataSource = MockNewsDataSource();
    repository = NewsRepositoryImpl(dataSource);
  });

  group('NewsRepository test', () {
    test(
        'Given NewsRepository, '
        'When get posts success, '
        'Then it should return correct list', () async {
      when(() => dataSource.getPost(0)).thenAnswer((_) async => data);

      final result = await repository.getPost(0);
      expect(result.data?.total, data.toEntity().total);
      expect(result.data?.page, data.toEntity().page);
      expect(result.data?.limit, data.toEntity().limit);
      expect(result.data?.data.first.id, data.toEntity().data.first.id);
    });

    test(
        'Given NewsRepository, '
        'When get by tags success, '
        'Then it should return correct list', () async {
      when(() => dataSource.getByTag('tag', 0)).thenAnswer((_) async => data);

      final result = await repository.getByTags('tag', 0);
      expect(result.data?.total, data.toEntity().total);
      expect(result.data?.page, data.toEntity().page);
      expect(result.data?.limit, data.toEntity().limit);
      expect(result.data?.data.first.id, data.toEntity().data.first.id);
    });
  });
}
