import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/extensions/context_extensions.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/presentation/dashboard/page/dashboard_screen.dart';
import 'package:social_media_app/presentation/splash/splash_screen.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_bloc.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_event.dart';
import 'package:social_media_app/presentation/user_detail/page/user_detail_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      DashboardScreen.routeName: (context) => DashboardScreen(),
      UserDetailScreen.routeName: (context) => BlocProvider<UserDetailBloc>(
        create: (_) {
          final bloc = UserDetailBloc(locator());
          bloc.id = context.args() as String;
          bloc.scrollCtrl.addListener(bloc.scrollListener);
          bloc.add(GetUserDetail());
          return bloc;
        },
        child: const UserDetailScreen(),
      ),
    };
  }
}
