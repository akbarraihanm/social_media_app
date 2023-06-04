import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/data/home/models/user_response.dart';

void main() {
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

  test(
      'Given UserResponse, '
      'When initialized '
      'Then it should return correct data', () {
    expect(data.total, 0);
    expect(data.page, 0);
    expect(data.limit, 0);
    expect(data.data?.first.id, 'id');
  });
}