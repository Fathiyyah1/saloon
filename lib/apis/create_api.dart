import 'package:cloud_firestore/cloud_firestore.dart';

Future createUserData(String id, bool isPremium) async {
  final _firestore = FirebaseFirestore.instance;
  try {
    await _firestore.collection("users").doc(id).set({
      "isPremium": isPremium,
    });
  } catch (e) {
    throw e;
  }
}
