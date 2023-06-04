import 'package:bloc/bloc.dart';
import 'package:social_media_app/domain/home/entity/user_entity.dart';
import 'package:social_media_app/domain/user_detail/use_case/user_detail_use_case.dart';
import 'package:social_media_app/presentation/friends/bloc/friends_event.dart';
import 'package:social_media_app/presentation/friends/bloc/friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final UserDetailUseCase useCase;

  List<DataUserEntity> list = [];

  FriendsBloc(this.useCase): super(Init()) {
    on<GetFriends>((event, emit) async {
      final result = await useCase.getFriends();
      list = result.data ?? [];
      emit(Init());
    });

    on<DeleteFriend>((event, emit) async {
      final result = await useCase.deleteFriend(event.data);
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else {
        add(GetFriends());
      }
    });
  }
}