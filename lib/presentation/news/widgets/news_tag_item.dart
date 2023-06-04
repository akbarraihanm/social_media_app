import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';

class NewsTagItem extends StatelessWidget {
  final String tag;
  final Function tapCancel;

  const NewsTagItem({
    Key? key,
    required this.tag,
    required this.tapCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () => tapCancel.call(),
              child: const Icon(Icons.cancel, size: 24, color: Colors.black),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColor.biruGelap,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: AppText(
                  title: tag,
                  textStyle: AppTypography.bodySmall(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
