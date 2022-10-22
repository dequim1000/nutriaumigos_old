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
    bool DiaSemana = false;

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
            Center(
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: Image.asset("assets/icons/alimento.png"),
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 10,
                ),
                const Text(
                  "Plano Alimentar",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: txtNomeAlimento,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: EdgeInsets.all(20),
                border: UnderlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                labelText: "Nome do Alimento",
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
              controller: txtQuantidade,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: EdgeInsets.all(20),
                border: UnderlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
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
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                contentPadding: EdgeInsets.all(20),
                border: UnderlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
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
            // Checkbox(
            //     value: "Segunda",
            //     onChanged: (DiaSemana) {
            //       print(checked);
            //     }),
            // Checkbox(
            //     value: "Segunda",
            //     onChanged: (DiaSemana) {
            //       print(checked);
            //     }),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 238, 214, 3),
                    Color.fromARGB(255, 247, 225, 32),
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
                          color: Colors.black,
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
