import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class Alimentos{
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  Future<User> getcurrentUser() async{
    return await auth.currentUser!;
  } 
  Future<void> createUserwithEmailAndPassword(
    String nome, String email, String senha, String telefone,String data, String cpf, String crmv, context) async {
    Map<String, dynamic> userInfoMap = {
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'data': data,
      'cpf': cpf,
      'crmv': crmv,
    };

    DatabaseMethods().addUserInfoToDB(auth.currentUser!.uid, userInfoMap);
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