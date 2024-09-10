import 'package:flutter/material.dart';

SnackBar failureSentData(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 4),
  );
}