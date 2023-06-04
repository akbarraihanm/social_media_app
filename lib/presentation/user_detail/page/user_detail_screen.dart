import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/base_components/app_bar.dart';
import 'package:social_media_app/core/components/base_components/app_text.dart';
import 'package:social_media_app/core/components/base_components/refresh_builder.dart';
import 'package:social_media_app/core/components/user_post/user_post_loading.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/config/app_typography.dart';
import 'package:social_media_app/core/util/app_util.dart';
import 'package:social_media_app/core/util/stretch_overscroll.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_bloc.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_event.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_state.dart';
import 'package:social_media_app/presentation/user_detail/widgets/profile_pict_item.dart';
import 'package:social_media_app/core/components/user_post/user_post_item.dart';
import 'package:social_media_app/presentation/user_detail/widgets/profile_pict_loading.dart';

class UserDetailScreen extends StatelessWidget {
  static const routeName = "/user-detail";

  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserDetailBloc>();

    return Scaffold(
      appBar: CustomAppBar.search(
        context: context,
        hint: "Search post...",
        onSubmit: (v) => bloc.add(SearchPosts(v)),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is SuccessAddFriend) {
            AppUtil.bindingInstance(() {
              AppUtil.showSnackBar(
                context,
                message: state.message,
                isError: false,
              );
            });
          }
          if (state is ShowError) {
            AppUtil.showError(context, message: state.message);
          }
          return StretchOverScrollWidget(
            child: RefreshBuilder(
              controller: bloc.scrollCtrl,
              refresh: () => bloc.add(GetUserDetail()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state is ShowLoading? const ProfilePictLoading(): ProfilePictItem(
                    data: bloc.data,
                    friends: bloc.friends,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    onAdd: (v) => bloc.add(AddFriend(v)),
                    onRemove: (v) => bloc.add(DeleteFriend(v)),
                  ),
                  Center(
                    child: AppText(
                      title: state is ShowLoading? "":
                      "${bloc.data?.firstName} ${bloc.data?.lastName}'s Posts",
                      width: double.infinity,
                      textStyle: AppTypography.titleMedium(),
                      bgColor: AppColor.abuAbu,
                      align: TextAlign.center,
                      padding: const EdgeInsets.only(bottom: 24, top: 16),
                    ),
                  ),
                  state is ShowLoading? const UserPostLoading(): ListView.separated(
                    itemCount: bloc.posts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    separatorBuilder: (ctx, _) => Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                    itemBuilder: (context, pos) => UserPostItem(
                      data: bloc.posts[pos],
                      likes: bloc.likes,
                      like: (v) => bloc.add(Like(v)),
                      unlike: (v) => bloc.add(Unlike(v)),
                    ),
                  ),
                  state is ShowPaginateLoading?
                  const UserPostLoading(): const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
