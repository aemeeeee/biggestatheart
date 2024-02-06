import 'package:cloud_firestore/cloud_firestore.dart';

//This folder stores classes that represent the major objects used
//These classes will be used to store the data returned from backend

//User class for user profile and authentication
class User {
  final String userid;
  final bool isAdmin;
  final String username;
  final String password;
  final String email;
  final String pfp;
  final String name;
  final int age;
  final String ethnicity;
  final String gender;
  final String educationLevel;
  final String occupation;
  final String interests;
  final String skills;
  final String preferences;
  final List<Timestamp>? availability;
  final List<int>? pastActivities;
  final List<int>? currentActivities;

//use of required keyword for fields that cannot be null
  User({
    required this.userid,
    required this.isAdmin,
    required this.username,
    required this.password,
    required this.email,
    required this.pfp,
    required this.name,
    required this.age,
    required this.ethnicity,
    required this.gender,
    required this.educationLevel,
    required this.occupation,
    required this.interests,
    required this.skills,
    required this.preferences,
    this.availability,
    this.pastActivities,
    this.currentActivities,
  });

  factory User.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final user = snapshot.data();
    return User(
      userid: snapshot.id,
      isAdmin: user?['isAdmin'] as bool,
      username: user?['username'] as String,
      password: user?['password'] as String,
      email: user?['email'] as String,
      pfp: user?['pfp'] as String,
      name: user?['name'] as String,
      age: user?['age'] as int,
      ethnicity: user?['ethnicity'] as String,
      gender: user?['gender'] as String,
      educationLevel: user?['educationLevel'] as String,
      occupation: user?['occupation'] as String,
      interests: user?['interests'] as String,
      skills: user?['skills'] as String,
      preferences: user?['preferences'] as String,
      availability: user?['availability'] is Iterable
          ? List<Timestamp>.from(user?['availability'])
          : null,
      pastActivities: user?['pastActivities'] is Iterable
          ? List<int>.from(user?['pastActivities'])
          : null,
      currentActivities: user?['currentActivities'] is Iterable
          ? List<int>.from(user?['currentActivities'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isAdmin': isAdmin,
      'username': username,
      'password': password,
      'email': email,
      'pfp': pfp,
      'name': name,
      'age': age,
      'ethnicity': ethnicity,
      'gender': gender,
      'educationLevel': educationLevel,
      'occupation': occupation,
      'interests': interests,
      'skills': skills,
      'preferences': preferences,
      'availability': availability,
      'pastActivities': pastActivities,
      'currentActivities': currentActivities,
    };
  }
}
