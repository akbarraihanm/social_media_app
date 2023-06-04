import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';

class UserPostItem extends StatelessWidget {
  final DataUserPost data;
  final List<DataUserPost> likes;
  final ValueChanged<DataUserPost> like;
  final ValueChanged<DataUserPost> unlike;
  final ValueChanged<String>? tapTag;

  const UserPostItem({
    Key? key,
    required this.data,
    required this.likes,
    required this.like,
    required this.unlike,
    this.tapTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    if (likes.isNotEmpty) {
      isLiked = likes
          .where((e) => e.id == data.id)
          .isNotEmpty;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColor.hitamPekat,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: Image
                      .network(
                    data.owner.picture,
                    fit: BoxFit.cover,
                  )
                      .image,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: "${data.owner.firstName} ${data.owner.lastName}",
                    textStyle:
                    AppTypography.titleSmall(color: AppColor.biruGelap),
                    margin: const EdgeInsets.only(bottom: 4),
                  ),
                  AppText(
                    title: data.publishDate,
                    textStyle: AppTypography.bodySmall(color: AppColor.biru),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 16),
          child: Image.network(
            data.image,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 56,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: data.tags.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (ctx, _) => const SizedBox(width: 8),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, pos) =>
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => tapTag?.call(data.tags[pos]),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.biruGelap,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        child: AppText(
                          title: data.tags[pos],
                          textStyle: AppTypography.bodySmall(
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ),
        AppText(
          title: data.text,
          textStyle: AppTypography.bodyMedium(),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        ),
        AppText(
          title: "${data.likes} like${data.likes < 2 ? "" : "s"}",
          textStyle: AppTypography.bodyMedium(color: AppColor.abuGelap),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 24),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              if (isLiked) {
                unlike.call(data);
              } else {
                like.call(data);
              }
            },
            child: Row(
              children: [
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  size: 22,
                  color: isLiked ? Colors.red : Colors.black,
                ),
                AppText(
                  title: isLiked ? "Unlike" : "Like",
                  textStyle: AppTypography.action(),
                  margin: const EdgeInsets.only(left: 4),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
