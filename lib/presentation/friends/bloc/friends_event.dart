import 'package:social_media_app/domain/home/entity/user_entity.dart';

abstract class FriendsEvent {}

class GetFriends extends FriendsEvent {}

class DeleteFriend extends FriendsEvent {
  DataUserEntity data;

  DeleteFriend(this.data);
}