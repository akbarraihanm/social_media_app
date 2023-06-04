import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/base_components/app_shimmer.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';

class UserPostLoading extends StatelessWidget {
  const UserPostLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      separatorBuilder: (ctx, _) => Container(
        height: 1,
        width: double.infinity,
        color: Colors.black12,
      ),
      itemBuilder: (context, pos) => const _UserPostItem(),
    );
  }
}

class _UserPostItem extends StatelessWidget {
  const _UserPostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColor.hitamPekat,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      width: 100,
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 4),
                    ),
                    Container(
                      height: 14,
                      width: 100,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8, top: 16),
            height: 300,
            width: double.infinity,
            color: Colors.white,
          ),
          SizedBox(
            height: 56,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (ctx, _) => const SizedBox(width: 8),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, pos) => Container(
                decoration: BoxDecoration(
                  color: AppColor.biruGelap,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: Container(
                      height: 12,
                      width: 64,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 14,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            color: Colors.white,
          ),
          AppText(
            title: "0 like",
            textStyle: AppTypography.bodyMedium(color: AppColor.abuGelap),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 24),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  size: 22,
                  color: Colors.red,
                ),
                AppText(
                  title: "Like",
                  textStyle: AppTypography.action(),
                  margin: const EdgeInsets.only(left: 4),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
