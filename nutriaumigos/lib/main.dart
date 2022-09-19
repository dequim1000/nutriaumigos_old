import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutriaumigos/Screens/Login/cadastro.dart';
import 'package:nutriaumigos/Screens/Login/recuperacao_senha.dart';
import 'package:nutriaumigos/Screens/Menu/home.page.dart';
import 'package:nutriaumigos/constants.dart';

import 'Screens/Login/login.dart';

void main() async{
  //await Firebase.initializeApp();
  runApp(MyApp());
} 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
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
      routes: {
        'login': (context) => const LoginPage(),
        'cadastro': (context) => const CadastroPage(),
        'recuperacao': (context) => const RecuperacaoSenhaPage(),
        'menuPrincipal': (context) => const HomePage(),
      },
    );
  }
}