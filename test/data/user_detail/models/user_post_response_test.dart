import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/data/home/models/user_response.dart';
import 'package:social_media_app/data/user_detail/models/user_post_response.dart';

void main() {
  final data = UserPostResponse.fromJsonMap({
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

  test(
      'Given UserPostResponse, '
      'When initialized, '
      'Then it should return correct data', () {
    expect(data.data?.first.id, 'id');
    expect(data.total, 0);
    expect(data.page, 0);
    expect(data.limit, 0);
  });
}