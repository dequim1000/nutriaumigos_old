import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/methods/database.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  var tipoUsuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
      body: FutureBuilder<DocumentSnapshot>(future: DatabaseMethods().getUserFromDB(FirebaseAuth.instance.currentUser!.uid), builder: (context, snapshot) {
        final crmv = snapshot.data?.data();
        if (crmv != null) {
          tipoUsuario = (crmv as Map)['crmv'];
        } else {
          tipoUsuario = null;
        }
        return _body(context);
      },),
    );
  }

  _body(context){
    return Container();
  }
}