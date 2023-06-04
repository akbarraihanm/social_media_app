import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_bloc.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_event.dart';

class BottomNavbar extends StatelessWidget {
  final DashboardBloc bloc;

  const BottomNavbar({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return BottomNavigationBar(
          selectedLabelStyle: AppTypography.action(
            color: AppColor.biruGelap,
          ),
          selectedItemColor: AppColor.biruGelap,
          unselectedLabelStyle: AppTypography.action(
            color: AppColor.abuGelap,
          ),
          showUnselectedLabels: true,
          unselectedItemColor: AppColor.abuGelap,
          iconSize: 24,
          elevation: 5.5,
          currentIndex: bloc.current,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
          onTap: (v) => bloc.add(ChangeMenu(v)),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new_sharp),
              label: "News",
              tooltip: "News",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              tooltip: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Friend List",
              tooltip: "Friend List",
            ),
          ],
        );
      }
    );
  }
}
