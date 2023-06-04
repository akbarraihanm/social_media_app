import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/core/util/resource.dart';
import 'package:social_media_app/domain/news/use_case/news_use_case.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/use_case/user_detail_use_case.dart';
import 'package:social_media_app/presentation/news/bloc/news_event.dart';
import 'package:social_media_app/presentation/news/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUseCase useCase;
  final UserDetailUseCase detailUseCase;

  List<DataUserPost> list = [];
  List<DataUserPost> liked = [];

  String selectedTag = "";
  final scrollCtrl = ScrollController();

  int _page = 0;
  int _total = 0;

  NewsBloc(this.useCase, this.detailUseCase): super(Init()) {
    on<GetNews>((event, emit) async {
      _page = 0;
      selectedTag = "";
      emit(ShowLoading());

      final result = await useCase.getPosts(_page);
      await _reloadLocal();

      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else {
        list = result.data?.data ?? [];
        _total = result.data?.total ?? 0;
        emit(Init());
      }
    });

    on<FilterByTag>((event, emit) async {
      _page = 0;
      emit(ShowLoading());
      selectedTag = event.tag;

      final result = await useCase.getByTags(selectedTag, _page);
      await _reloadLocal();

      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else {
        list = result.data?.data ?? [];
        _total = result.data?.total ?? 0;
        emit(Init());
      }
    });

    on<PaginateNews>((event, emit) async {
      _page++;
      emit(ShowPaginateLoading());

      late Resource<UserPostEntity> result;
      if (selectedTag.isNotEmpty) {
        result = await useCase.getByTags(selectedTag, _page);
      } else {
        result = await useCase.getPosts(_page);
      }
      await _reloadLocal();

      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else {
        list.addAll(result.data?.data ?? []);
        _total = result.data?.total ?? 0;
        emit(Init());
      }
    });

    on<Like>((event, emit) async {
      final result = await detailUseCase.like(event.data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        await _reloadLocal();
        emit(Init());
      }
    });

    on<Unlike>((event, emit) async {
      final result = await detailUseCase.unlike(event.data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        await _reloadLocal();
        emit(Init());
      }
    });
  }

  Future _reloadLocal() async {
    final result = await detailUseCase.getLikes();
    liked = result.data ?? [];
  }

  void paginate() {
    if (scrollCtrl.position.maxScrollExtent == scrollCtrl.offset
        && list.length < _total) {
      add(PaginateNews());
    }
  }
}