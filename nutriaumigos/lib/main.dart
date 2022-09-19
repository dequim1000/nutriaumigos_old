import 'package:flutter/material.dart';
import 'package:nutriaumigos/constants.dart';

import 'Screens/Login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutri Aumigos',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
      home: const LoginPage(),
    );
  }
}