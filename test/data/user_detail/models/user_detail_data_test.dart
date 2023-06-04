import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/data/user_detail/models/user_detail_data.dart';

void main() {
  final data = UserDetailData.fromJsonMap({
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
    'registerDate': '2000-01-01T00:00:00.000Z',
    'updatedDate': '2000-01-01T00:00:00.000Z',
  });

  test(
      'Given UserDetailData, '
      'When initialized, '
      'Then it should return correct data', () {
    expect(data.id, 'id');
    expect(data.title, 'title');
    expect(data.firstName, 'firstName');
  });
}