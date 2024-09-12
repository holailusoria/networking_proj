part of 'main_page_bloc.dart';

sealed class MainPageEvent extends Equatable {}

final class SendDataEvent extends MainPageEvent {
  final String username;
  final String email;
  final String phone;

  SendDataEvent(this.username, this.email, this.phone);

  @override
  List<Object?> get props => [username, email, phone];
}
