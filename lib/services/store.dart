import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_flutter/models/message.dart';

abstract class BaseStore {
  Stream<QuerySnapshot<Map<String, dynamic>>> get messagesSnapshots;
  Future<void> addMessage(Message newMessage);
}

class Firestore implements BaseStore {
  static const _messagesCollectionName = 'messages';

  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> get messagesSnapshots =>
      _messagesCollection.snapshots();

  @override
  Future<void> addMessage(Message newMessage) async {
    await _messagesCollection.add(newMessage.toMap());
  }

  CollectionReference<Map<String, dynamic>> get _messagesCollection =>
      _firebaseFirestore.collection(_messagesCollectionName);
}
