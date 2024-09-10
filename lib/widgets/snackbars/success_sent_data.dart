import 'package:flutter/material.dart';

SnackBar successSentData() {
  return const SnackBar(
      content: Text('Successful request'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 4),
  );
}