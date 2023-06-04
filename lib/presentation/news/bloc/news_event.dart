import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

abstract class NewsEvent {}

class GetNews extends NewsEvent {}

class FilterByTag extends NewsEvent {
  String tag;

  FilterByTag(this.tag);
}

class PaginateNews extends NewsEvent {}

class Like extends NewsEvent {
  DataUserPost data;

  Like(this.data);
}

class Unlike extends NewsEvent {
  DataUserPost data;

  Unlike(this.data);
}