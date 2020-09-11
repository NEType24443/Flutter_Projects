import 'package:flutter/material.dart';
import 'package:workshop_2/registration_screen.dart';
import 'package:workshop_2/welcome_screen.dart';
import 'package:workshop_2/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
