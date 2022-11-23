import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/message.dart';
 
class ChatProvider {
 final FirebaseFirestore firebaseFirestore;
 
 ChatProvider({required this.firebaseFirestore});
 
 Stream<QuerySnapshot> getMessageList(String author, String reader) {
   return firebaseFirestore
       .collection('messages')
       .where('author', isEqualTo: author)
       .where('reader', isEqualTo: reader)
       .orderBy('timestamp', descending: true)
       .snapshots();
 }
 
 void sendMessage(String message, String author, String reader) {
   MessageModel chatMessages = MessageModel(
     author: author,
     reader: reader,
     timestamp: Timestamp.now(),
     message: message,
   );
 
   firebaseFirestore.collection('messages').add(chatMessages.toJson());
 }
}