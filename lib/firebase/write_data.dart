import 'package:cloud_firestore/cloud_firestore.dart';

Future putUser(String username) async {
  final doc = FirebaseFirestore.instance.collection('users');
  print(doc);
}
