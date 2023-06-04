import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/news/data_source/news_data_source.dart';
import 'package:social_media_app/data/news/service/news_service.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService service;
  late NewsDataSource dataSource;

  final userPost = UserPostResponse.fromJsonMap({
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
    service = MockNewsService();
    dataSource = NewsDataSourceImpl(service);
  });

  group('NewsDataSource test', () {
    test(
        'Given NewsDataSource, '
        'When get news success, '
        'Then it should return correct data', () async {
      when(() => service.getPost(0)).thenAnswer((_) async => userPost);

      final result = await dataSource.getPost(0);
      expect(result.toJson(), userPost.toJson());
    });

    test(
        'Given NewsDataSource, '
        'When get by tags success, '
        'Then it should return correct data', () async {
      when(() => service.getByTag('tag', 0)).thenAnswer((_) async => userPost);

      final result = await dataSource.getByTag('tag', 0);
      expect(result.toJson(), userPost.toJson());
    });
  });
}