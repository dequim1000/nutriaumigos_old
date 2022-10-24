import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/constants.dart';
import 'package:nutriaumigos/methods/database.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key, required this.tipoUsuario});
  final tipoUsuario;
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  String namePesquisa = '';

  get kPrimaryColor => null;

  var usuarios;

  @override
  void initState() {
    super.initState();
    if(widget.tipoUsuario == 'Clientes'){
      usuarios = FirebaseFirestore.instance
        .collection('user')
        .where('crmv', isNotEqualTo: '');
    }else{
      usuarios = FirebaseFirestore.instance
        .collection('user')
        .where('crmv', isEqualTo: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    String usuario = '';
    if(widget.tipoUsuario == 'Clientes'){
      usuario = 'Nutricionistas';
    }else{
      usuario = 'Clientes';
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
      // floatingActionButton: FloatingActionButton(
      //   foregroundColor: kPrimaryColor,
      //   backgroundColor: kSecondColor,
      //   child: const Icon(
      //     Icons.add,
      //     color: Color.fromRGBO(3, 152, 158, 0.73),
      //     size: 32,
      //   ),
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'brocasPage');
      //   },
      // ),
      appBar: AppBar(
        title: Text(usuario),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {  },),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Pesquisar...'),
            onChanged: ((value) {
              setState(() {
                namePesquisa = value;
              });
            }),
          ),
          Container(
            child: StreamBuilder<QuerySnapshot>(
              //fonte de dados (coleção)
              stream: usuarios.snapshots(),

              //exibir os dados recuperados
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Text('Não foi possível conectar ao Firestore'),
                    );

                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  default:
                    return Container(
                      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - AppBar().preferredSize.height - 72,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          if (namePesquisa.isEmpty) {
                            return exibirItem(data);
                          }
                          if (data['name']
                              .toString()
                              .toLowerCase()
                              .startsWith(namePesquisa.toLowerCase())) {
                            return exibirItem(data);
                          }
                          return Container();
                        },
                        padding: EdgeInsets.all(20),
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget exibirItem(item) {
    String nomeUsuario = item['nome'];
    String descricao = item['crmv'] == '' ? 'Cliente' : item['crmv'];

    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        tileColor: Colors.white,
        contentPadding: EdgeInsets.all(10),
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: const Icon(
          Icons.account_circle,
          size: 56,
          color: Colors.grey,
        ),
        title: Text(
          nomeUsuario,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          descricao,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Image.asset(
                'assets/icons/osso-de-cao.png',
                height: 40,
                width: 40,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}