abstract class UserDetailState {}

class Init extends UserDetailState {}

class ShowLoading extends UserDetailState {}

class ShowPaginateLoading extends UserDetailState {}

class SuccessAddFriend extends UserDetailState {
  String message;

  SuccessAddFriend(this.message);
}

class ShowError extends UserDetailState {
  String message;

  ShowError(this.message);
}