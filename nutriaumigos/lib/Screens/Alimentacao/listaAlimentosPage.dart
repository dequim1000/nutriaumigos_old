import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/constants.dart';
import 'package:nutriaumigos/methods/database.dart';

class ListaAlimentosPage extends StatefulWidget {
  const ListaAlimentosPage(
      {super.key,
      required this.tipoUsuario,
      required this.idPet,
      required this.stateAlimentacao,
      required this.stateFeedback,
      this.idDono});
  final tipoUsuario;
  final idPet;
  final stateAlimentacao;
  final stateFeedback;
  final idDono;

  @override
  State<ListaAlimentosPage> createState() => _ListaAlimentosPageState();
}

class _ListaAlimentosPageState extends State<ListaAlimentosPage> {
  String namePesquisa = '';
  var tipoUsuario;
  var alimentos;
  var nutricionista;
  String idUsuario = '';

  get kPrimaryColor => null;

  @override
  void initState() {
    super.initState();
    print(widget.tipoUsuario);
    idUsuario = FirebaseAuth.instance.currentUser!.uid;
    print(idUsuario);
    if (widget.tipoUsuario == 'Clientes') {
      alimentos = FirebaseFirestore.instance
          .collection('alimentos')
          .where('idPet', isEqualTo: widget.idPet);
    } else {
      alimentos = FirebaseFirestore.instance
          .collection('alimentos')
          .where('idPet', isEqualTo: widget.idPet);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('StatusAlimentacao' + widget.stateAlimentacao.toString());
    print('StateFeedback' + widget.stateFeedback.toString());
    print("IdUsuario1:" + idUsuario);
    String usuario = '';
    if (widget.tipoUsuario == 'Clientes') {
      usuario = 'Nutricionistas';
    } else {
      usuario = 'Clientes';
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
      floatingActionButton: FloatingActionButton(
        foregroundColor: kPrimaryColor,
        backgroundColor: kSecondColor,
        child: const Icon(
          Icons.add,
          color: Color.fromRGBO(3, 152, 158, 0.73),
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            'animais',
            arguments: {
              'idPets': '',
              'tipoUsuario': tipoUsuario,
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text("Plano Alimentar"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Pesquisar...',
              filled: true,
              fillColor: Colors.white,
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
            onChanged: ((value) {
              setState(() {
                namePesquisa = value;
              });
            }),
          ),
          Container(
            child: StreamBuilder<QuerySnapshot>(
              //fonte de dados (coleção)
              stream: alimentos.snapshots(),

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
                      height: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          AppBar().preferredSize.height -
                          82,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          var idAlimento = snapshot.data!.docs[index].reference.id;
                          if (namePesquisa.isEmpty) {
                            return exibirItem(data, idUsuario, idAlimento);
                          }
                          if (data['name']
                              .toString()
                              .toLowerCase()
                              .startsWith(namePesquisa.toLowerCase())) {
                            return exibirItem(data, idUsuario, idAlimento);
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

  Widget exibirItem(item, String idUsuario, String idAlimento) {
    print("IdUsuario2:" + idUsuario);
    String? diaSemanaAlimento = item['diaSemana'];
    String? nomeAnimalAlimento = item['nomeAnimal'];
    String? horarioAlimento = item['horario'];
    String? quantidadeAlimento = item['quantidade'];

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
        leading: Image.asset('assets/icons/osso-de-cao.png'),
        title: Text(
          diaSemanaAlimento.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              nomeAnimalAlimento.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              horarioAlimento.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              quantidadeAlimento.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
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
        onTap: () {
          Navigator.pushNamed(
            context,
            'alimentos',
            arguments: {
              'tipoUsuario': tipoUsuario,
              'idAlimento': idAlimento,
              'idPet': widget.idPet,
              'idDono': widget.idDono,
              'stateAlimentacao': widget.stateAlimentacao,
              'stateFeedback': widget.stateFeedback,
            },
          );
        },
        onLongPress: () {
          dialog(idUsuario, idAlimento, context);
        },
      ),
    );
  }
}

Future<void> dialog(String idUsuario, String idAlimento, context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Excluir Pet?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Você excluirá permanentemente o Pet junto com seus alimentos!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Excluir'),
            onPressed: () async {
              try {
                //await Pets().deletePet(idPet);
              } catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Erro ao Excluir o Animal"),
                    duration: Duration(
                      seconds: 2,
                    ),
                  ),
                );
              }
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
