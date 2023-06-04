import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/home/use_case/home_use_case.dart';
import 'package:social_media_app/presentation/home/bloc/home_event.dart';
import 'package:social_media_app/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase useCase;

  List<DataUserEntity> list = [];
  int _page = 0;
  int _totalData = 0;

  final scrollCtrl = ScrollController();

  HomeBloc(this.useCase): super(Init()) {
    on<GetUser>((event, emit) async {
      emit(ShowLoading());
      _page = 0;

      final result = await useCase.getUsers(_page);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowError(result.unauthorized ?? ""));
      } else {
        list = result.data?.data ?? [];
        _totalData = result.data?.total ?? 0;
        emit(Init());
      }
    });

    on<PaginateUser>((event, emit) async {
      emit(ShowPaginateLoading());
      _page++;

      final result = await useCase.getUsers(_page);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else if (result.unauthorized != null) {
        emit(ShowError(result.unauthorized ?? ""));
      } else {
        list.addAll(result.data?.data ?? []);
        emit(Init());
      }
    });
  }

  void scrollListener() {
    if (scrollCtrl.position.maxScrollExtent == scrollCtrl.offset
        && list.length < _totalData) {
      add(PaginateUser());
    }
  }
}