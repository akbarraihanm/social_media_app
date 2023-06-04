abstract class FriendsState {}

class Init extends FriendsState {}

class ShowError extends FriendsState {
  String message;

  ShowError(this.message);
}