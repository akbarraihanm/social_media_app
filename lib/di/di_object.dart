import 'package:alice/alice.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media_app/database/database.dart';
import 'package:social_media_app/di/dashboard/di_object.dart';
import 'package:social_media_app/di/home/di_object.dart';
import 'package:social_media_app/di/news/di_object.dart';
import 'package:social_media_app/di/user_detail/di_object.dart';

final locator = GetIt.instance;

class AppLocator {
  static void initAlice(Alice alice) {
    /// Init Alice
    locator.registerSingleton(alice);
  }

  static Future init() async {
    /// Init all locator here
    await DatabaseLocator.init();
    DashboardLocator.init();
    HomeLocator.init();
    UserDetailLocator.init();
    NewsLocator.init();
  }

  /// Getter for Alice inspector
  static Alice get alice => locator();
}