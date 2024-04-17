import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/class34_Login/signup.dart';
import 'login.dart';
import 'home.dart';

Future<void> main() async {//위젯 바인딩을 해줘야함
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        /*경로에 따라 보여지는 화면*/
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
