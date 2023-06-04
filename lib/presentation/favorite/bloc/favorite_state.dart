abstract class FavoriteState {}

class Init extends FavoriteState {}

class ShowError extends FavoriteState {
  String message;

  ShowError(this.message);
}