import 'package:bloc/bloc.dart';
import 'package:social_media_app/domain/user_detail/entity/user_post_entity.dart';
import 'package:social_media_app/domain/user_detail/use_case/user_detail_use_case.dart';
import 'package:social_media_app/presentation/favorite/bloc/favorite_event.dart';
import 'package:social_media_app/presentation/favorite/bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final UserDetailUseCase useCase;

  List<DataUserPost> likes = [];

  FavoriteBloc(this.useCase): super(Init()) {
    on<GetLikes>((event, emit) async {
      final result = await useCase.getLikes();
      likes = result.data ?? [];
      emit(Init());
    });

    on<Unlike>((event, emit) async {
      final result = await useCase.unlike(event.data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        add(GetLikes());
      }
    });
  }
}