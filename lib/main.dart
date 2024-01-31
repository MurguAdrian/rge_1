import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rge_1/authentification/login_screen.dart';

import 'Screen/login_page.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}

// Restul codului

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roserv Green Energy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
