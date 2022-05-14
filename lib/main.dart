import 'package:flutter/material.dart';

import 'modules/social_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manssour Chat Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SocialLoginScreen(),
    );
  }
}





