import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_media_app/core/common/route.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AppLocator.initAlice(alice);
  await AppLocator.init();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final alice = Alice(
  showNotification: true,
  showInspectorOnShake: true,
  darkTheme: false,
  maxCallsCount: 1000,
  navigatorKey: navigatorKey,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Social Media App',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: AppRoute.routeNames(context),
      ),
    );
  }
}
