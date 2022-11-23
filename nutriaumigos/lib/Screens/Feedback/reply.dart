import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nutriaumigos/constants.dart';

import '../../Models/feedback.dart';

class ReplyPage extends StatefulWidget {
  const ReplyPage(
      {super.key,
      required this.tipoUsuario,
      required this.stateAlimentacao,
      required this.stateFeedback,
      required this.idPet,
      required this.idFeedback,
      required this.idAlimento});
  final tipoUsuario;
  final stateAlimentacao;
  final stateFeedback;
  final idPet;
  final idFeedback;
  final idAlimento;

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

var txtReply = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _ReplyPageState extends State<ReplyPage> {
  List allFeedback = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.idFeedback != null && widget.idFeedback != '') {
    //   getReplyById(widget.idFeedback);
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reply",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(3, 152, 158, 0.73),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            cleanCampos();
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
      body: Container(
        color: kPrimaryColor,
        padding: const EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    icon: Image.asset("assets/icons/feedback_white.png"),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Cadastro de Feedback",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: TextField(
                  controller: txtReply,
                  autofocus: true,
                  //enabled: widget.tipoUsuario == 'Clientes',
                  decoration: const InputDecoration(
                    labelText: 'Resposta do feedback',
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 25),
                  maxLines: 10,
                  minLines: 2,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              if (widget.tipoUsuario != 'Clientes')
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (allFeedback.isEmpty) {
                            try {
                              await FeedbackClass()
                                  .createReply(widget.idPet, widget.idAlimento,
                                      widget.idFeedback, txtReply.text, context)
                                  .then(
                                (value) {
                                  cleanCampos();
                                  Navigator.pop(context);
                                },
                              );
                            } catch (e) {
                              print(e);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Erro ao Cadastrar o Reply"),
                                  duration: Duration(
                                    seconds: 2,
                                  ),
                                ),
                              );
                            }
                          }
                          // } else {
                          //   try {
                          //     await FeedbackClass()
                          //         .updateFeedback(
                          //             widget.idPet,
                          //             widget.idAlimento,
                          //             txtAvaliacao.text,
                          //             txtRejeicao.text,
                          //             txtQuantidade.text,
                          //             txtObservacao.text,
                          //             idFeedback,
                          //             context)
                          //         .then(
                          //       (value) {
                          //         Navigator.pop(context);
                          //       },
                          //     );
                          //   } catch (e) {
                          //     print(e);
                          //     ScaffoldMessenger.of(context).showSnackBar(
                          //       const SnackBar(
                          //         content: Text("Erro ao Atualizar o Animal"),
                          //         duration: Duration(
                          //           seconds: 2,
                          //         ),
                          //       ),
                          //     );
                          //   }
                          // }
                          //Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ),
              if (widget.tipoUsuario == 'Clientes')
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: TextButton(
                      child: const Text(
                        "Cancelar",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kSecondColor),
                      ),
                      onPressed: () {
                        cleanCampos();
                        Navigator.pop(context, false);
                      }),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

cleanCampos() {
  txtReply.text = '';
}

getReplyById(String idReply) async {
  await FirebaseFirestore.instance
      .collection('replyFeedback')
      .doc(idReply)
      .get()
      .then((value) {
    txtReply.text = value.get('reply');
  });
}
