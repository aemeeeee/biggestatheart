import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceCertificatePage {
  // write a function to get the user name from firestore
  Future<String> getUserName(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return documentSnapshot.get('name');
  }

  // write a function to get the total hours from firestore
  Future<int> getTotalHours(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return documentSnapshot.get('totalHours');
  }
}
