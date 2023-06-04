import 'package:hive/hive.dart';
import 'package:social_media_app/database/const/database_string.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

class DatabaseLocator {
  static Future init() async {
    /// Register adapters
    Hive.registerAdapter(DataUserEntityAdapter());
    Hive.registerAdapter(DataUserPostAdapter());

    /// Open DataUserEntity box
    Box<DataUserEntity> userEntity = await Hive.openBox(DatabaseString.userEntity);
    locator.registerSingleton(userEntity);

    /// Open DataUserPost box
    Box<DataUserPost> userPost = await Hive.openBox(DatabaseString.userPost);
    locator.registerSingleton(userPost);
  }
}