import 'package:flutter/material.dart';
import 'package:social_media_app/core/common/navigation.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/presentation/dashboard/page/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AppNav.replace(context: context, routeName: DashboardScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.biru,
      body: Center(
        child: AppText(
          title: "Social Media App",
          textStyle: AppTypography.headLine(color: Colors.white),
        ),
      ),
    );
  }
}
