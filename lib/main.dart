import 'package:flutter/material.dart';
import 'package:loggin_screen/screens/home_screen.dart';
import 'package:loggin_screen/screens/login_screen.dart';
import 'package:loggin_screen/screens/registration_screen.dart';
import 'package:loggin_screen/screens/verification_code_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => Registeration(),
        '/verfication': (context) => VerificationCodeScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
