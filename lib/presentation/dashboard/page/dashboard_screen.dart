import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/di/di_object.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_state.dart';
import 'package:social_media_app/presentation/dashboard/widgets/bottom_nav_bar.dart';
import 'package:social_media_app/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:social_media_app/presentation/favorite/bloc/favorite_event.dart';
import 'package:social_media_app/presentation/favorite/page/favorite_screen.dart';
import 'package:social_media_app/presentation/friends/bloc/friends_bloc.dart';
import 'package:social_media_app/presentation/friends/bloc/friends_event.dart';
import 'package:social_media_app/presentation/friends/page/friends_screen.dart';
import 'package:social_media_app/presentation/home/bloc/home_bloc.dart';
import 'package:social_media_app/presentation/home/bloc/home_event.dart';
import 'package:social_media_app/presentation/home/page/home_screen.dart';
import 'package:social_media_app/presentation/news/bloc/news_bloc.dart';
import 'package:social_media_app/presentation/news/bloc/news_event.dart';
import 'package:social_media_app/presentation/news/page/news_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";
  final _bloc = locator<DashboardBloc>();

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (_) {
                final bloc = HomeBloc(locator());
                bloc.scrollCtrl.addListener(bloc.scrollListener);
                return bloc..add(GetUser());
              },
            child: const HomeScreen(),
          ),
          BlocProvider<NewsBloc>(
            create: (_) {
              final bloc = NewsBloc(locator(), locator());
              bloc.scrollCtrl.addListener(bloc.paginate);
              return bloc..add(GetNews());
            },
            child: const NewsScreen(),
          ),
          BlocProvider<FavoriteBloc>(
            create: (_) => FavoriteBloc(locator())..add(GetLikes()),
            child: const FavoriteScreen(),
          ),
          BlocProvider<FriendsBloc>(
            create: (_) => FriendsBloc(locator())..add(GetFriends()),
            child: const FriendsScreen(),
          ),
        ],
        child: BlocBuilder(
          bloc: _bloc,
          builder: (ctx, state) {
            if (state is ShowPost) return const NewsScreen();
            if (state is ShowFavorite) return const FavoriteScreen();
            if (state is ShowFriends) return const FriendsScreen();
            return const HomeScreen();
          },
        ),
      ),
      bottomNavigationBar: BottomNavbar(bloc: _bloc),
    );
  }
}
