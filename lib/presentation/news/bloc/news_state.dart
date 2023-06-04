abstract class NewsState {}

class Init extends NewsState {}

class ShowLoading extends NewsState {}

class ShowPaginateLoading extends NewsState {}

class ShowError extends NewsState {
  String message;

  ShowError(this.message);
}