import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/components/base_components/refresh_builder.dart';
import 'package:social_media_app/core/config/app_color.dart';
import 'package:social_media_app/core/util/app_util.dart';
import 'package:social_media_app/core/util/stretch_overscroll.dart';
import 'package:social_media_app/presentation/home/bloc/home_bloc.dart';
import 'package:social_media_app/presentation/home/bloc/home_event.dart';
import 'package:social_media_app/presentation/home/bloc/home_state.dart';
import 'package:social_media_app/presentation/home/page/home_loading.dart';
import 'package:social_media_app/presentation/home/page/home_paginate_loading.dart';
import 'package:social_media_app/presentation/home/widgets/home_user_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final paginateState = context.watch<HomeBloc>().state;

    return Scaffold(
      backgroundColor: AppColor.abuTerang,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 12,
      ),
      body: StretchOverScrollWidget(
        child: RefreshBuilder(
          refresh: () => bloc.add(GetUser()),
          controller: bloc.scrollCtrl,
          child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is ShowLoading) return const HomeLoading();
              if (state is ShowError) {
                AppUtil.showError(context, message: state.message);
              }
              return Column(
                children: [
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 152,
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bloc.list.length,
                    itemBuilder: (ctx, pos) => HomeUserItem(data: bloc.list[pos]),
                  ),
                  paginateState is ShowPaginateLoading?
                  const HomePaginateLoading(): const SizedBox(),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

