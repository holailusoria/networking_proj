import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../repository/dio_client.dart';
import '../repository/send_user_data.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<SendCredentials>((event, emit)  async {
      emit(InProgress());

      try {
        var result = await SendUserData.instance.sendUserData(event.username, event.email, event.phone);

        if(result['statusCode'] != 200) {
          emit(FailureSent('Server error: ${result['message']}'));
        } else {
          emit(SuccessSent());
        }
      } on SocketException catch(_) {
        emit(NoInternetConnection());
      } on TimeoutException catch(_) {
        emit(TimeoutException());
      } catch(ex) {
        emit(FailureSent('An unknown error occurred: $ex'));
      }
    });
  }
}
