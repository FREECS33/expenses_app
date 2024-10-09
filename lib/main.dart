import 'package:actividad_2/modules/auth/screens/input_email.dart';
import 'package:actividad_2/modules/auth/screens/login.dart';
import 'package:actividad_2/modules/auth/screens/replace_password.dart';
import 'package:actividad_2/modules/auth/screens/validate_code.dart';
import 'package:actividad_2/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/input_email': (context) => const InputEmail(),
        '/validate_code': (context) => const ValidateCode(
              code: 0,
            ),
        '/replace_password': (context) => const ReplacePassword()
      },
    );
  }
}
