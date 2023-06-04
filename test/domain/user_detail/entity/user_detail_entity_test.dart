import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';

void main() {
  final data = UserDetailEntity(
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
        timezone: 'timezone'),
    registerDate: 'registerDate',
    updatedDate: 'updatedDate',
  );

  test(
      'Given UserDetailEntity, '
      'When initialized, '
      'Then it should return correct data', () {
    expect(data.id, 'id');
    expect(data.title, 'title');
    expect(data.firstName, 'firstName');
    expect(data.location.state, 'state');
    expect(data.location.city, 'city');
  });
}
