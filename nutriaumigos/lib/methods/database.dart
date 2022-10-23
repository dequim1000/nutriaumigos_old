import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("user")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addAlimentosInfoToDB(String alimentoId, Map<String, dynamic> alimentoInfoMap) {
    return FirebaseFirestore.instance
        .collection("alimentos")
        .doc(alimentoId)
        .set(alimentoInfoMap);
  }

  Future addPetsInfoToDB(String petId, Map<String, dynamic> petsInfoMap) {
    return FirebaseFirestore.instance
        .collection("pets")
        .doc(petId)
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