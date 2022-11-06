import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addUsersInfoToDB(Map<String, dynamic> usersInfoMap) {
    return FirebaseFirestore.instance.collection("usernutri").add(usersInfoMap);
  }

  Future addAlimentosInfoToDB(Map<String, dynamic> alimentoInfoMap) {
    return FirebaseFirestore.instance
        .collection("alimentos")
        .add(alimentoInfoMap);
  }

  Future updateAlimentosInfoToDB(Map<String, dynamic> alimentoInfoMap, String idAlimento) {
    return FirebaseFirestore.instance
        .collection("alimentos")
        .doc(idAlimento)
        .set(alimentoInfoMap);
  }

  Future addPetsInfoToDB(Map<String, dynamic> petsInfoMap) {
    return FirebaseFirestore.instance.collection("pets").add(petsInfoMap);
  }

  Future updatePetsInfoToDB(Map<String, dynamic> petsInfoMap, String idPet) {
    return FirebaseFirestore.instance
        .collection("pets")
        .doc(idPet)
        .set(petsInfoMap);
  }

  Future deletePetsInfoToDB(String idPet) {
    return FirebaseFirestore.instance.collection('pets').doc(idPet).delete();
  }

  Future addFeedbackInfoToDB(
      String feedbackId, Map<String, dynamic> feedbackInfoMap) {
    return FirebaseFirestore.instance
        .collection("feedback")
        .doc(feedbackId)
        .set(feedbackInfoMap);
  }

  Future<DocumentSnapshot> getUserFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNutritoClientesFromDB(
      String clienteId) {
    return FirebaseFirestore.instance
        .collection("usernutri")
        .where("idClientes", isEqualTo: clienteId)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getClientestoNutriFromDB(
      String nutriId) {
    return FirebaseFirestore.instance
        .collection("usernutri")
        .where("idNutri", isEqualTo: nutriId)
        .snapshots();
  }
}
