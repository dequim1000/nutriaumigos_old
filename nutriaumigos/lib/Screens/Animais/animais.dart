import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/constants.dart';

class AnimaisPage extends StatefulWidget {
  const AnimaisPage({super.key});

  @override
  State<AnimaisPage> createState() => _AnimaisPageState();
}

class _AnimaisPageState extends State<AnimaisPage> {
  @override
  Widget build(BuildContext context) {
    var txtNomeAnimal = TextEditingController();
    var txtRaca = TextEditingController();
    var txtCor = TextEditingController();
    var txtTipo = TextEditingController();
    var txtAlergias = TextEditingController();
    var txtPeso = TextEditingController();
    var txtRejeicao = TextEditingController();
    var txtProblemas = TextEditingController();
    var txtObservacao = TextEditingController();
    var txtDescricao = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Center(
                child: Text(
                  "Pets",
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
                    icon: Image.asset("assets/icons/pet.png"),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    "Cadastro de Animais",
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
                controller: txtNomeAnimal,
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
                  labelText: "Nome do Animal",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Nome do Animal';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtRaca,
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
                  labelText: "Raça",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Raça';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtCor,
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
                  labelText: "Cor",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Cor';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtTipo,
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
                  labelText: "Tipo Ex:(Cachorro,Gato...)",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Tipo do Animal';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtAlergias,
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
                  labelText: "Alergia(s)",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Alergias';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtPeso,
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
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Peso';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtRejeicao,
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
                  labelText: "Possui alguma Rejeição?",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Rejeição';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtProblemas,
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
                  labelText: "Problemas",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 20,
                ),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Problemas';
                  }
                  return null;
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtObservacao,
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
                  labelText: "Observações",
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
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha o campo de Descrição';
                  }
                  return null;
                }),
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
                          child:
                              Image.asset("assets/icons/icon_bone_verde.png"),
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
