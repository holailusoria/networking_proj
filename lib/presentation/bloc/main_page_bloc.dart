import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networking_proj/core/error/error_mapper.dart';
import '../../domain/use_cases/send_user_data_use_case.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final SendUserDataUseCase _sendUserDataUseCase;

  MainPageBloc(this._sendUserDataUseCase) : super(MainPageInitial()) {
    on<SendDataEvent>(_onSendDataEvent);
  }

  Future<void> _onSendDataEvent(SendDataEvent event,
      Emitter<MainPageState> emit) async {
    emit(SendingState());

    try {
      final result = await _sendUserDataUseCase(event.username, event.email, event.phone);
      _handleServerResponse(result, emit);
    } catch (ex) {
      _handleError(ex, emit);
    }
  }

  void _handleServerResponse(Map<String, dynamic> result, Emitter<MainPageState> emit) {
    final serverError = ErrorMapper.mapServerResponse(result);

    if (serverError != null) {
      emit(ErrorState(serverError));
    } else {
      emit(SuccessSent());
    }
  }

  void _handleError(Object error, Emitter<MainPageState> emit) {
    final errorMessage = ErrorMapper.mapErrorToMessage(error);
    print(errorMessage);
    emit(ErrorState('An unknown error occurred: $errorMessage'));
  }
}
