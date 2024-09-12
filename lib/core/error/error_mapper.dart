import 'dart:async';
import 'dart:io';

final class ErrorMapper {
  static String mapErrorToMessage(Object error) {
    if(error is SocketException) {
      return 'Network error. Please check your connection.';
    } else if(error is TimeoutException) {
      return 'Server error occurred. Try again later.';
    }

    String? errorMessage;
    if(error is Exception) {
      errorMessage = error.toString();
    }

    return '$errorMessage An unknown error occurred. Please try again.';
  }
}