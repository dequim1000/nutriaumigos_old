import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/methods/database.dart';

class ListaAnimaisPage extends StatefulWidget {
  const ListaAnimaisPage({super.key});

  @override
  State<ListaAnimaisPage> createState() => _ListaAnimaisPageState();
}

class _ListaAnimaisPageState extends State<ListaAnimaisPage> {
  var tipoUsuario;
  
  get kPrimaryColor => null;
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

  _body(context) {
    String nomeUsuario = tipoUsuario == null || tipoUsuario == '' ? 'Clientes' : 'Nutricionistas';
    return Container(
      color: kPrimaryColor,
      height: 800,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}