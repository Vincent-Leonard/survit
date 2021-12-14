import 'package:flutter/material.dart';
import 'package:survit/views/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        Login.routeName: (context) => const Login(),
        Register.routeName: (context) => const Register(),
        Home.routeName: (context) => const Home(),
        Menu.routeName: (context) => Menu(),
        SurveyDetail.routeName: (context) => const SurveyDetail(),
      },
    );
  }
}
