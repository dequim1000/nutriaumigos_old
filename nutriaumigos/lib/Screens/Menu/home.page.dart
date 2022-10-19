import 'package:flutter/material.dart';
import 'package:nutriaumigos/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      color: const Color.fromARGB(184, 76, 0, 255),
      height: 800,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              _actions(context),
              _banner(),
              _diasSemanas(),
              _cardAlimentacao(),
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
        "Menu",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kPrimaryLightColor,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    ),
  );
}

_actions(context) {
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
          _buildCard(context, 'Nutricionista',
              'assets/icons/patinhaColor_icon.png', 'login'),
          const SizedBox(width: 5),
          _buildCard(
              context, 'Pet', 'assets/icons/patinha_icon.png', 'cadastro'),
          const SizedBox(width: 5),
          _buildCard(context, 'Alimentos', 'assets/icons/osso-de-cao.png',
              'recuperacao'),
          const SizedBox(width: 5),
          _buildCard(
              context, 'FeedBack', 'assets/icons/estrela.png', 'menuPrincipal'),
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

_banner() {
  return Container(
    width: 400,
    height: 100,
    margin: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
      color: Colors.red,
    ),
  );
}

_diasSemanas() {
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
        SizedBox(
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
}

_cardAlimentacao() {
  return Container(
    width: 400,
    height: 500,
    margin: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
      color: Colors.red,
    ),
  );
}

_buildCard(
    BuildContext context, String name, String imageButton, String nomeTela) {
  return SizedBox(
    width: 100,
    height: 100,
    child: Column(
      children: [
        GestureDetector(
          onTap: () => {Navigator.pushReplacementNamed(context, nomeTela)},
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
          name,
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
