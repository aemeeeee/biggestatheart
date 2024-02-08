import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/user.dart';

class FirebaseServiceUser {
  // query user data such as 
  Future<List<String>> getUserDataByField(String field) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where(field, isEqualTo: value)
        .get();
    List<String> userData = [];
    for (var doc in querySnapshot.docs) {
      userData.add(doc.id);
    }
    return userData;
  }
}