part of 'main_page_bloc.dart';

sealed class MainPageState extends Equatable {}

final class MainPageInitial extends MainPageState {
  @override
  List<Object?> get props => [];
}

final class InProgress extends MainPageState {
  @override
  List<Object?> get props => [];
}

final class SuccessSent extends MainPageState {

  @override
  List<Object?> get props => [];
}

final class FailureSent extends MainPageState {
  final String message;

  FailureSent(this.message);

  @override
  List<Object?> get props => [message];
}

final class NoInternetConnection extends MainPageState {
  @override
  List<Object?> get props => [];
}

final class TimeoutException extends MainPageState {
  @override
  List<Object?> get props => [];
}
