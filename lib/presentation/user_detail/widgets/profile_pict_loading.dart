import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/base_components/app_button.dart';
import 'package:social_media_app/core/components/base_components/app_shimmer.dart';
import 'package:social_media_app/core/config/app_color.dart';

class ProfilePictLoading extends StatelessWidget {
  const ProfilePictLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColor.hitam,
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  child: AppButton(
                    title: "Add Friend",
                    color: AppColor.biru,
                    isEnable: true,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 16,
              width: 200,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 12, bottom: 16),
            ),
            Container(
              height: 14,
              width: 80,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 8),
            ),
            Container(
              height: 14,
              width: 120,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 8),
            ),
            Container(
              height: 14,
              width: 80,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 8),
            ),
            Container(
              height: 14,
              width: 120,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 8),
            ),
          ],
        ),
      ),
    );
  }
}
