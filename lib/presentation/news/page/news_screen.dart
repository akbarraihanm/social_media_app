import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/base_components/refresh_builder.dart';
import 'package:social_media_app/core/components/user_post/user_post_item.dart';
import 'package:social_media_app/core/components/user_post/user_post_loading.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/util/app_util.dart';
import 'package:social_media_app/core/util/stretch_overscroll.dart';
import 'package:social_media_app/presentation/news/bloc/news_bloc.dart';
import 'package:social_media_app/presentation/news/bloc/news_event.dart';
import 'package:social_media_app/presentation/news/bloc/news_state.dart';
import 'package:social_media_app/presentation/news/widgets/news_tag_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewsBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 12,
      ),
      backgroundColor: AppColor.abuTerang,
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is ShowError) {
            AppUtil.showError(context, message: state.message);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: bloc.selectedTag.isNotEmpty,
                child: NewsTagItem(
                  tag: bloc.selectedTag,
                  tapCancel: () => bloc.add(GetNews()),
                ),
              ),
              Expanded(
                child: StretchOverScrollWidget(
                  child: RefreshBuilder(
                    refresh: () {
                      if (bloc.selectedTag.isNotEmpty) {
                        bloc.add(FilterByTag(bloc.selectedTag));
                      } else {
                        bloc.add(GetNews());
                      }
                    },
                    controller: bloc.scrollCtrl,
                    child: Column(
                      children: [
                        state is ShowLoading? const UserPostLoading(): ListView.separated(
                          itemCount: bloc.list.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          separatorBuilder: (ctx, _) => Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.black12,
                          ),
                          itemBuilder: (context, pos) => UserPostItem(
                            data: bloc.list[pos],
                            likes: bloc.liked,
                            like: (v) => bloc.add(Like(v)),
                            unlike: (v) => bloc.add(Unlike(v)),
                            tapTag: (v) => bloc.add(FilterByTag(v)),
                          ),
                        ),
                        Visibility(
                          visible: state is ShowPaginateLoading,
                          child: const UserPostLoading(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
