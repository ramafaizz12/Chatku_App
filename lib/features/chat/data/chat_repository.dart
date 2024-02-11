import 'package:chat_app_firebase/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // kirim pesan
  Future<void> sendMessage(String receiverid, String message) async {
    final String currentuser = _auth.currentUser!.uid;
    final String currentemail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newmessage = Message(
        senderId: currentuser,
        senderEmail: currentemail,
        receiverId: receiverid,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentuser, receiverid];
    ids.sort();
    String chatroomid = ids.join("_");

    await _firestore
        .collection('chat_room')
        .doc(chatroomid)
        .collection('messages')
        .add(newmessage.toMap());
  }

  // get pesan
  Stream<QuerySnapshot> getMessage(String userid, String otheruserid) {
    List<String> ids = [otheruserid, userid];
    ids.sort();

    String chatroomid = ids.join("_");

    return _firestore
        .collection('chat_room')
        .doc(chatroomid)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots();
  }
}
