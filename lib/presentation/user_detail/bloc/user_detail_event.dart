import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class UserDetailEvent {}

class GetUserDetail extends UserDetailEvent {}

class GetUserPost extends UserDetailEvent {}

class PaginateUserPost extends UserDetailEvent {}

class SearchPosts extends UserDetailEvent {
  String text;

  SearchPosts(this.text);
}

class AddFriend extends UserDetailEvent {
  UserDetailEntity? data;

  AddFriend(this.data);
}

class DeleteFriend extends UserDetailEvent {
  UserDetailEntity? data;

  DeleteFriend(this.data);
}

class Like extends UserDetailEvent {
  DataUserPost data;

  Like(this.data);
}

class Unlike extends UserDetailEvent {
  DataUserPost data;

  Unlike(this.data);
}