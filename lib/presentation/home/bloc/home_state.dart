abstract class HomeState {}

class Init extends HomeState {}

class ShowLoading extends HomeState {}

class ShowPaginateLoading extends HomeState {}

class ShowError extends HomeState {
  String message;

  ShowError(this.message);
}