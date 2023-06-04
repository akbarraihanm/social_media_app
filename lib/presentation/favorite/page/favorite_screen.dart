import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/base_components/refresh_builder.dart';
import 'package:social_media_app/core/components/user_post/user_post_item.dart';
import 'package:social_media_app/core/util/stretch_overscroll.dart';
import 'package:social_media_app/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:social_media_app/presentation/favorite/bloc/favorite_event.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 12,
      ),
      body: StretchOverScrollWidget(
        child: RefreshBuilder(
          refresh: () => bloc.add(GetLikes()),
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              return ListView.separated(
                itemCount: bloc.likes.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                separatorBuilder: (ctx, _) => Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black12,
                ),
                itemBuilder: (context, pos) => UserPostItem(
                  data: bloc.likes[pos],
                  likes: bloc.likes,
                  like: (v) {},
                  unlike: (v) => bloc.add(Unlike(v)),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
