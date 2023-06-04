import 'package:bloc/bloc.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_event.dart';
import 'package:social_media_app/presentation/dashboard/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  int current = 0;

  DashboardBloc(): super(Init()) {
    on<ChangeMenu>((event, emit) {
      current = event.pos;
      if (current == 0) {
        emit(Init());
      } else if (current == 1) {
        emit(ShowPost());
      } else if (current == 2) {
        emit(ShowFavorite());
      } else {
        emit(ShowFriends());
      }
    });
  }

}