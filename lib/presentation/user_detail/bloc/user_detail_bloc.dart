import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_detail_entity.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/use_case/user_detail_use_case.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_event.dart';
import 'package:social_media_app/presentation/user_detail/bloc/user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UserDetailUseCase  useCase;

  UserDetailEntity? data;
  List<DataUserPost> posts = [];
  List<DataUserPost> likes = [];
  List<DataUserEntity> friends = [];

  String id = "";
  int _page = 0;
  int _total = 0;

  final scrollCtrl = ScrollController();

  UserDetailBloc(this.useCase): super(Init()) {
    on<GetUserDetail>((event, emit) async {
      emit(ShowLoading());

      final result = await useCase.getDetail(id);
      await _reloadLocal();

      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowError(result.unauthorized ?? ""));
      } else {
        data = result.data;
        add(GetUserPost());
      }
    });

    on<GetUserPost>((event, emit) async {
      _page = 1;

      final result = await useCase.getUserPost(id);

      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowError(result.unauthorized ?? ""));
      } else {
        posts = result.data?.data ?? [];
        _total = result.data?.total ?? 0;
        emit(Init());
      }
    });

    on<PaginateUserPost>((event, emit) async {
      _page++;
      emit(ShowPaginateLoading());

      final result = await useCase.getUserPost(id, _page);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowError(result.unauthorized ?? ""));
      } else {
        posts.addAll(result.data?.data ?? []);
        _total = result.data?.total ?? 0;
        emit(Init());
      }
    });

    on<SearchPosts>((event, emit) {
      if (event.text.isNotEmpty) {
        final search = posts.where((e) {
          return e.text.toLowerCase().contains(event.text.toLowerCase());
        }).toList();
        posts = search;
        emit(Init());
      } else {
        add(GetUserPost());
      }
    });

    on<AddFriend>((event, emit) async {
      final data = DataUserEntity(
        id: event.data?.id ?? "",
        title: event.data?.title ?? "",
        firstName: event.data?.firstName ?? "",
        lastName: event.data?.lastName ?? "",
        picture: event.data?.picture ?? "",
      );
      final result = await useCase.addFriend(data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        await _reloadLocal();
        emit(SuccessAddFriend("Added as a friend"));
      }
    });

    on<DeleteFriend>((event, emit) async {
      final data = DataUserEntity(
        id: event.data?.id ?? "",
        title: event.data?.title ?? "",
        firstName: event.data?.firstName ?? "",
        lastName: event.data?.lastName ?? "",
        picture: event.data?.picture ?? "",
      );
      final result = await useCase.deleteFriend(data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        await _reloadLocal();
        emit(SuccessAddFriend("Removed from friend's list"));
      }
    });

    on<Like>((event, emit) async {
      final result = await useCase.like(event.data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        await _reloadLocal();
        emit(Init());
      }
    });

    on<Unlike>((event, emit) async {
      final result = await useCase.unlike(event.data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        await _reloadLocal();
        emit(Init());
      }
    });
  }

  void scrollListener() {
    if (scrollCtrl.position.maxScrollExtent == scrollCtrl.offset
        && posts.length < _total) {
      add(PaginateUserPost());
    }
  }

  Future _reloadLocal() async {
    final friendResult = await useCase.getFriends();
    final postResult = await useCase.getLikes();
    friends = friendResult.data ?? [];
    likes = postResult.data ?? [];
  }

}