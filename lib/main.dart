import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/di/di.dart';
import 'presentation/views/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Networking Project',
      home: MainPage(),
    );
  }
}
