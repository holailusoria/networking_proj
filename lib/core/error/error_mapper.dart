import 'dart:async';
import 'dart:io';

final class ErrorMapper {
  static String? mapServerResponse(Map<String, dynamic>? response) {
    if (response == null || response.isEmpty) {
      return 'Empty response from server';
    }

    if (!response.containsKey('statusCode') || response['statusCode'] is! int) {
      return 'Invalid response from server';
    }

    if (response['statusCode'] != 200) {
      final errorMessage = response.containsKey('message') && response['message'] is String
          ? response['message']
          : 'Unknown server error';
      return 'Server error: $errorMessage';
    }

    return null;
  }

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