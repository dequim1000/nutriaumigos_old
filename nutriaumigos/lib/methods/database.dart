import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("clientes")
        .add(userInfoMap);
  }

  Future addNutriInfoToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("nutri")
        .add(userInfoMap);
  }

  Future<DocumentSnapshot> getUserFromDB(String userId) async {
    return FirebaseFirestore.instance.collection("users").doc(userId).get();
  }
}