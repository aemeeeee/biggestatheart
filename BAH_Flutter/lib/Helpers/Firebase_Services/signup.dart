import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//class which stores the functions responsible for Firebase backend communication
class FirebaseServiceSignup {
  Future<void> addUser(
    String email,
    String username,
    String password,
    String name,
    int age,
    String ethnicity,
    String gender,
    String educationLevel,
    String occupation,
    String interests,
    String skills,
    String preferences,
  ) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error: $e");
    }
    final userId = _auth.currentUser?.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(userId)
        .set({
          'isAdmin': false,
          'username': username,
          'password': password,
          'email': email,
          'pfp': "",
          'name': name,
          'age': age,
          'ethnicity': ethnicity,
          'gender': gender,
          'educationLevel': educationLevel,
          'occupation': occupation,
          'interests': interests,
          'skills': skills,
          'preferences': preferences,
          'availability': [],
          'pastActivities': [],
          'currentActivities': [],
          'createdAt': DateTime.now()
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

checkBlank(String value) {
  if (value == '') {
    print('$value: true');
  } else {
    return print('$value: false');
  }
}
