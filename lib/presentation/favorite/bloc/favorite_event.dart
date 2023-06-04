import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class FavoriteEvent {}

class GetLikes extends FavoriteEvent {}

class Unlike extends FavoriteEvent {
  DataUserPost data;

  Unlike(this.data);
}