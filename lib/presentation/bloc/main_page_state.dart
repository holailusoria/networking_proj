part of 'main_page_bloc.dart';

sealed class MainPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MainPageInitial extends MainPageState {}

final class SendingState extends MainPageState {}

final class SuccessSent extends MainPageState {}

final class ErrorState extends MainPageState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
