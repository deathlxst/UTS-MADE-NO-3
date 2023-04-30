import 'package:flutter/material.dart';
import 'login_page.dart';
import 'success_page.dart';
import 'failure_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/success': (context) => const SuccessPage(username: '', role: ''),
        '/failure': (context) =>  FailedPage(message: 'Login Failed!'),
      },
    );
  }
}