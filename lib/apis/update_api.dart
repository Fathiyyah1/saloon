import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateApi {
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('users');

  // Future<void> updateOrAddProgress(String userId, Progress newProgress) async {
  //   try {
  //     final DocumentSnapshot userDataSnapshot =
  //         await userDataCollection.doc(userId).get();

  //     if (userDataSnapshot.exists) {
  //       final Map<String, dynamic> userData =
  //           userDataSnapshot.data() as Map<String, dynamic>;
  //       final List progress = userData['progress'] ?? [];

  //       // Find the progress item with matching quizID
  //       final int index =
  //           progress.indexWhere((item) => item['quizID'] == newProgress.quizID);

  //       if (index != -1) {
  //         progress[index] = newProgress.toJson();
  //       } else {
  //         progress.add(newProgress.toJson());
  //       }

  //       await userDataCollection.doc(userId).update({'progress': progress});
  //     } else {
  //       // Handle user not found
  //       print('User not found');
  //     }
  //   } catch (e) {
  //     // Handle error
  //     print('Failed to update or add progress: $e');
  //   }
  // }

  Future<void> userBecomePremium(String userId) async {
    try {
      await userDataCollection.doc(userId).update({'isPremium': true});
    } catch (e) {
      // Handle error
      print('Failed to update user premium status: $e');
    }
  }
}
