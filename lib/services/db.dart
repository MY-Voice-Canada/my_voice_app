import 'package:cloud_firestore/cloud_firestore.dart';

class MVDB {
  final String uid;

  MVDB({required this.uid});

  static final CollectionReference jaQuestionsCollection =
      FirebaseFirestore.instance.collection("justaskquestions");

  Future<void> addUserQuestion({
    required String name,
    required String email,
    required String question,
  }) async {
    DocumentSnapshot docSnapshot = await jaQuestionsCollection.doc(uid).get();
    if (docSnapshot.exists) {
      return await jaQuestionsCollection.doc(uid).update({
        "questions": FieldValue.arrayUnion([question]),
      });
    } else
      return await jaQuestionsCollection.doc(uid).set({
        "userInfo": {
          "name": name,
          "email": email,
        },
        "questions": [question],
      });
  }
}
