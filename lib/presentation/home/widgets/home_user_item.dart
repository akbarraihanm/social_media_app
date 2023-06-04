import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/core/common/navigation.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/presentation/user_detail/page/user_detail_screen.dart';

class HomeUserItem extends StatelessWidget {
  final DataUserEntity data;

  const HomeUserItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () => AppNav.push(
          context: context,
          routeName: UserDetailScreen.routeName,
          arguments: data.id,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
              child: Image.network(
                data.picture,
                width: double.infinity,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            AppText(
              title: "${toBeginningOfSentenceCase(data.title)}."
                  " ${data.firstName} ${data.lastName}",
              textStyle: AppTypography.bodyMedium(),
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ],
        ),
      ),
    );
  }
}
