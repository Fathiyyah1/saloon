// Get userdata for the user, it should get isPremium value only for now,
// use firebase api
import 'package:cloud_firestore/cloud_firestore.dart';

Future getUserData(String id) async {
  final _firestore = FirebaseFirestore.instance;
  try {
    final data = await _firestore.collection("users").doc(id).get();
    return data.data();
  } catch (e) {
    throw e;
  }
}
