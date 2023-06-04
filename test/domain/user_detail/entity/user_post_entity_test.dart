import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

void main() {
  final data = UserPostEntity(
    data: [],
    total: 0,
    page: 0,
    limit: 0,
  );

  test(
      'Given UserPostEntity, '
      'When initialized, '
      'Then it should return correct data', () {
    expect(data.data, []);
    expect(data.total, 0);
    expect(data.page, 0);
    expect(data.limit, 0);
  });
}
