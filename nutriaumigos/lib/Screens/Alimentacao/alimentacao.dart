import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/constants.dart';

class AlimentacaoPage extends StatefulWidget {
  const AlimentacaoPage({super.key});

  @override
  State<AlimentacaoPage> createState() => _AlimentacaoPageState();
}

class _AlimentacaoPageState extends State<AlimentacaoPage> {
  @override
  Widget build(BuildContext context) {
    var txtNomeAlimento = TextEditingController();
    var txtQuantidade = TextEditingController();
    var txtDescricao = TextEditingController();
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            const Center(
              child: Text(
                "Cadastro de Alimento",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset("assets/icons/alimento.png"),
                  color: Colors.white,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 25,
                ),
                const Text(
                  "Plano Alimentar",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: txtNomeAlimento,
              autofocus: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Nome do Alimento",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: txtQuantidade,
              obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Quantidade",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: txtDescricao,
              autofocus: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Descrição",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    kPrimaryColor,
                    kSecondColor,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: Image.asset("assets/icons/paw_dog.png"),
                      ),
                      const Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 10,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: Image.asset("assets/icons/icon_bone_verde.png"),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
