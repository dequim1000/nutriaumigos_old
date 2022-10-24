import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class Pets {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> createPets(
      String nome,
      String tipo,
      String raca,
      String cor,
      String sexo,
      double peso,
      String alergia,
      String rejeicao,
      String problemas,
      String observacoes,
      String descricao,
      context) async {
    Map<String, dynamic> petsInfoMap = {
      'idDono': auth.currentUser?.uid,
      'nome': nome,
      'tipo': tipo,
      'raca': raca,
      'cor': cor,
      'sexo': sexo,
      'peso': peso,
      'alergia': alergia,
      'rejeicao': rejeicao,
      'problemas': problemas,
      'observacoes': observacoes,
      'descricao': descricao
    };

    DatabaseMethods().addPetsInfoToDB(petsInfoMap);
  }

  Future<void> loginwithEmailAndPassword(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
