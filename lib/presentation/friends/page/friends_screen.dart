import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app/core/components/base_components/app_button.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/components/base_components/refresh_builder.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/core/extensions/context_extensions.dart';
import 'package:social_media_app/core/util/stretch_overscroll.dart';
import 'package:social_media_app/presentation/friends/bloc/friends_bloc.dart';
import 'package:social_media_app/presentation/friends/bloc/friends_event.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FriendsBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 12,
      ),
      body: StretchOverScrollWidget(
        child: RefreshBuilder(
          refresh: () => bloc.add(GetFriends()),
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return SizedBox(
                height: context.mediaHeight,
                child: ListView.separated(
                  itemCount: bloc.list.length,
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (ctx, pos) => const SizedBox(height: 12),
                  itemBuilder: (ctx, pos) {
                    final data = bloc.list[pos];
                    return Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor: AppColor.hitam,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: Image.network(
                                    data.picture,
                                    fit: BoxFit.cover,
                                  ).image,
                                ),
                              ),
                              AppText(
                                title: "${toBeginningOfSentenceCase(data.title)}."
                                    " ${data.firstName} ${data.lastName}",
                                margin: const EdgeInsets.only(left: 12),
                                textStyle: AppTypography.titleSmall(),
                                overflow: TextOverflow.ellipsis,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        AppButton(
                          title: "Remove Friend",
                          width: 120,
                          color: Colors.red,
                          isEnable: true,
                          onPressed: () => bloc.add(DeleteFriend(data)),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
