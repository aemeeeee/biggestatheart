import 'package:biggestatheart/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceIndividualReport {
  Future<List<User>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('isAdmin', isEqualTo: false)
        .get();
    List<User> users = [];
    for (var doc in querySnapshot.docs) {
      User user = User.fromFireStore(doc, null);
      users.add(user);
    }
    users.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return users;
  }
}
