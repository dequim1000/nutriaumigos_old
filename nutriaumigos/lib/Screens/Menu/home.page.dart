import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutriaumigos/constants.dart';
import 'package:nutriaumigos/methods/auth.dart';
import 'package:nutriaumigos/methods/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tipoUsuario;
  String usuario = '';
  String nomeUsuario = '';
  final USER_CLIENTE = 'Clientes';
  final USER_NUTRI = 'Nutricionistas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
      body: FutureBuilder<DocumentSnapshot>(
        future: DatabaseMethods()
            .getUserFromDB(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          final crmv = snapshot.data?.data();
          if (crmv != null) {
            tipoUsuario = (crmv as Map)['crmv'];
            usuario = tipoUsuario == null || tipoUsuario == ''
                ? USER_CLIENTE
                : USER_NUTRI;
            nomeUsuario = usuario == USER_CLIENTE ? USER_NUTRI : USER_CLIENTE;
          } else {
            tipoUsuario = null;
          }
          return _body(context);
        },
      ),
    );
  }

  _body(context) {
    double altura = tipoUsuario == null || tipoUsuario == '' ? 100 : 350;
    return Container(
      color: kPrimaryColor,
      height: 800,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              _actions(context, usuario, nomeUsuario),
              _banner(altura),
              _diasSemanas(tipoUsuario),
              _cardAlimentacao(context, tipoUsuario),
            ],
          ),
        ),
      ),
    );
  }
}

_title() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: const Center(
      child: Text(
        "NutriAumigos",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    ),
  );
}

_actions(context, String tipoUsuario, String nomeUsuario) {
  String navegacaoTela = '';
  if (tipoUsuario == 'Clientes') {
    navegacaoTela = 'listaAnimais';
  } else {
    navegacaoTela = 'listaUsuarios';
  }
  return Container(
    height: 100,
    margin: const EdgeInsets.only(top: 30),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 7,
            ),
          ),
          _buildCard(
              context,
              nomeUsuario,
              tipoUsuario,
              'assets/icons/patinhaColor_icon.png',
              'listaUsuarios',
              false,
              false),
          const SizedBox(width: 5),
          _buildCard(context, 'Pet', tipoUsuario,
              'assets/icons/patinha_icon.png', navegacaoTela, false, false),
          const SizedBox(width: 5),
          _buildCard(context, 'Alimentos', tipoUsuario,
              'assets/icons/osso-de-cao.png', navegacaoTela, true, false),
          const SizedBox(width: 5),
          _buildCard(context, 'FeedBack', tipoUsuario,
              'assets/icons/estrela.png', navegacaoTela, false, true),
          const Padding(
            padding: EdgeInsets.only(
              right: 15,
            ),
          ),
        ],
      ),
    ),
  );
}

_banner(double altura) {
  return Container(
    width: 400,
    height: altura,
    margin: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
      color: kSecondColor,
    ),
    child: const Center(
      child: Text(
        "Anuncie Aqui!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    ),
  );
}

_diasSemanas(tipoUsuario) {
  if (tipoUsuario == '' || tipoUsuario == null) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 20),
      child: Row(
        children: [
          const Text(
            "Plano Alimentar",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: kPrimaryLightColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {},
          ),
          const Text(
            "Terça",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: kPrimaryLightColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
}

_cardAlimentacao(context, tipoUsuario) {
  if (tipoUsuario == '' || tipoUsuario == null) {
    return Container(
      width: 400,
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _listaAlimentos(),
              _listaAlimentos(),
              _listaAlimentos(),
              _listaAlimentos(),
            ],
          ),
        ],
      ),
    );
  } else {
    return Container();
  }
}

_listaAlimentos() {
  var imageAlimento = 'assets/icons/patinha_icon.png';
  var nomeAlimento = 'Banana Com Aveia e Mel';
  var pesoAlimento = '200g';
  var nomePet = 'Joselito Soares';
  var horarioAlimento = '12:00';

  return Container(
    width: 400,
    height: 100,
    margin: const EdgeInsets.only(top: 20, bottom: 10),
    decoration: BoxDecoration(
      color: kPrimaryLightColor,
      border: Border.all(
          color: Color.fromARGB(255, 218, 218, 218),
          width: 3.0), // Set border width
      borderRadius: const BorderRadius.all(
          Radius.circular(10.0)), // Set rounded corner radius
    ),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Image.asset(imageAlimento, height: 60, width: 60),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                nomeAlimento,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                nomePet,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    pesoAlimento,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 130),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.orange,
                        ),
                        Text(
                          horarioAlimento,
                          style: const TextStyle(
                              color: Colors.orange, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

_buildCard(
    BuildContext context,
    String tituloCard,
    String tipoUsuario,
    String imageButton,
    String nomeTela,
    bool stateAlimentacao,
    bool stateFeedback) {
  return SizedBox(
    width: 110,
    height: 110,
    child: Column(
      children: [
        GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, nomeTela, arguments: {
              'tipoUsuario': tipoUsuario,
              'stateAlimentacao': stateAlimentacao,
              'stateFeedback': stateFeedback,
            })
          },
          child: Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(239, 239, 239, 1),
              border: Border.all(
                  color: const Color.fromRGBO(239, 239, 239, 1),
                  width: 3.0), // Set border width
              borderRadius: const BorderRadius.all(
                  Radius.circular(10.0)), // Set rounded corner radius
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(imageButton, height: 37, width: 37),
            ),
          ),
        ),
        Text(
          tituloCard,
          style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(196, 196, 196, 1),
              fontSize: 16),
        )
      ],
    ),
  );
}
