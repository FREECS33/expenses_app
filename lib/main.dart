import 'package:actividad_2/modules/auth/screens/create_account.dart';
import 'package:actividad_2/modules/auth/screens/input_email.dart';
import 'package:actividad_2/modules/auth/screens/login.dart';
import 'package:actividad_2/modules/auth/screens/replace_password.dart';
import 'package:actividad_2/modules/auth/screens/validate_code.dart';
import 'package:actividad_2/modules/user/screens/profile.dart';
import 'package:actividad_2/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/register': (context) => const CreateAccount(),
        '/profile': (context) => const Profile(),
        '/input_email': (context) => const InputEmail(),
        '/validate_code': (context) => const ValidateCode(
              code: 0,
            ),
        '/replace_password': (context) => const ReplacePassword()
      },
    );
  }
}
