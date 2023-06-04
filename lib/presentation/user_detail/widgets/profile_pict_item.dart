import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/core/components/base_components/app_button.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';

class ProfilePictItem extends StatelessWidget {
  final UserDetailEntity? data;
  final List<DataUserEntity> friends;
  final EdgeInsets? margin;
  final ValueChanged<UserDetailEntity?> onAdd;
  final ValueChanged<UserDetailEntity?> onRemove;

  const ProfilePictItem({
    Key? key,
    required this.data,
    this.margin,
    required this.friends,
    required this.onAdd,
    required this.onRemove
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAdded = false;
    if (friends.isNotEmpty) {
      isAdded = friends.where((e) => e.id == data?.id).isNotEmpty;
    }

    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: AppColor.hitam,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: Image.network(
                    data?.picture ?? "",
                    fit: BoxFit.cover,
                  ).image,
                ),
              ),
              const Expanded(child: SizedBox()),
              Expanded(
                child: AppButton(
                  title: isAdded? "Remove Friend": "Add Friend",
                  color: isAdded? Colors.red: AppColor.biru,
                  isEnable: true,
                  onPressed: () {
                    if (isAdded) {
                      onRemove.call(data);
                    } else {
                      onAdd.call(data);
                    }
                  },
                ),
              ),
            ],
          ),
          AppText(
            title: "${toBeginningOfSentenceCase(data?.title)}. ${data?.firstName} ${data?.lastName}",
            textStyle: AppTypography.titleSmall(),
            margin: const EdgeInsets.only(top: 12, bottom: 16),
          ),
          _ColItem(
            title: "Gender",
            value: toBeginningOfSentenceCase(data?.gender ?? "") ?? "",
          ),
          _ColItem(
            title: "Date of Birth",
            value: data?.dateOfBirth ?? "2000-01-01",
          ),
          _ColItem(
            title: "Join From",
            value: data?.registerDate ?? "2000-01-01",
          ),
          _ColItem(
            title: "Email",
            value: data?.email ?? "-",
          ),
          _ColItem(
            title: "Address",
            value: "${data?.location.street}, ${data?.location.city}, "
                "${data?.location.state}, ${data?.location.country}",
          ),
        ],
      ),
    );
  }
}

class _ColItem extends StatelessWidget {
  final String title;
  final String value;

  const _ColItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText(
              title: "$title: ",
              textStyle: AppTypography.titleCustom(
                color: AppColor.abuGelap,
                size: 12,
              ),
            ),
            Expanded(
              child: AppText(
                title: value,
                textStyle: AppTypography.bodySmall(),
                maxLine: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
