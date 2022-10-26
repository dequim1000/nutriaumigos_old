import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addUsersInfoToDB(Map<String, dynamic> usersInfoMap) {
    return FirebaseFirestore.instance
        .collection("usernutri")
        .add(usersInfoMap);
  }

  Future addAlimentosInfoToDB(String alimentoId, Map<String, dynamic> alimentoInfoMap) {
    return FirebaseFirestore.instance
        .collection("alimentos")
        .doc(alimentoId)
        .set(alimentoInfoMap);
  }

  Future addPetsInfoToDB(Map<String, dynamic> petsInfoMap) {
    return FirebaseFirestore.instance
        .collection("pets")
        .add(petsInfoMap);
  }

  Future updatePetsInfoToDB(Map<String, dynamic> petsInfoMap, String idPet) {
    return FirebaseFirestore.instance
        .collection("pets")
        .doc(idPet)
        .set(petsInfoMap);
  }

  Future addFeedbackInfoToDB(String feedbackId, Map<String, dynamic> feedbackInfoMap) {
    return FirebaseFirestore.instance
        .collection("feedback")
        .doc(feedbackId)
        .set(feedbackInfoMap);
  }

  Future<DocumentSnapshot> getUserFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNutritoClientesFromDB(String clienteId) {
    return FirebaseFirestore.instance.collection("usernutri").where("idClientes", isEqualTo:clienteId).get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getClientestoNutriFromDB(String nutriId) {
    return FirebaseFirestore.instance.collection("usernutri").where("idNutri", isEqualTo:nutriId).snapshots();
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsertoClienteFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").where('crmv', isEqualTo: '').snapshots();
  }

  Future<DocumentSnapshot> getUsertoNutricionistaFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<DocumentSnapshot> getAlimentostoClienteFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<DocumentSnapshot> getAlimentostoNutricionistaFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<DocumentSnapshot> getPetstoClientesFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<DocumentSnapshot> getPetstoNutricionistaFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<DocumentSnapshot> getFeedbacktoClientesFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }

  Future<DocumentSnapshot> getFeedbacktoNutricionistaFromDB(String userId) {
    return FirebaseFirestore.instance.collection("user").doc(userId).get();
  }
}