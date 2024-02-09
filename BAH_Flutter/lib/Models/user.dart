import 'package:cloud_firestore/cloud_firestore.dart';

//This folder stores classes that represent the major objects used
//These classes will be used to store the data returned from backend

//User class for user profile and authentication
class User {
  final String userid;
  final bool isAdmin;
  final String username;
  final String phoneNumber;
  final String email;
  final String pfp;
  final String name;
  final DateTime dob;
  final String ethnicity;
  final String gender;
  final String educationLevel;
  final String occupation;
  final String interests;
  final String skills;
  final String preferences;
  final int totalHours;
  final List<Timestamp>? availability;
  final List<String>? pastActivities;
  final List<String>? currentActivities;

//use of required keyword for fields that cannot be null
  User({
    required this.userid,
    required this.isAdmin,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.pfp,
    required this.name,
    required this.dob,
    required this.ethnicity,
    required this.gender,
    required this.educationLevel,
    required this.occupation,
    required this.interests,
    required this.skills,
    required this.preferences,
    required this.totalHours,
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
      isAdmin: user?['isAdmin'] == null ? false : user?['isAdmin'] as bool,
      username: user?['username'] == null ? '' : user?['username'] as String,
      phoneNumber:
          user?['phoneNumber'] == null ? '' : user?['phoneNumber'] as String,
      email: user?['email'] == null ? '' : user?['email'] as String,
      pfp: user?['pfp'] == null ? '' : user?['pfp'] as String,
      name: user?['name'] == null ? '' : user?['name'] as String,
      dob: user?['dob'] == null ? DateTime.now() : user?['dob'] as DateTime,
      ethnicity: user?['ethnicity'] == null ? '' : user?['ethnicity'] as String,
      gender: user?['gender'] == null ? '' : user?['gender'] as String,
      educationLevel: user?['educationLevel'] == null
          ? ''
          : user?['educationLevel'] as String,
      occupation:
          user?['occupation'] == null ? '' : user?['occupation'] as String,
      interests: user?['interests'] == null ? '' : user?['interests'] as String,
      skills: user?['skills'] == null ? '' : user?['skills'] as String,
      preferences:
          user?['preferences'] == null ? '' : user?['preferences'] as String,
      totalHours: user?['totalHours'] == null ? 0 : user?['totalHours'] as int,
      availability: user?['availability'] is Iterable
          ? List<Timestamp>.from(user?['availability'])
          : null,
      pastActivities: user?['pastActivities'] is Iterable
          ? List<String>.from(user?['pastActivities'])
          : null,
      currentActivities: user?['currentActivities'] is Iterable
          ? List<String>.from(user?['currentActivities'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isAdmin': isAdmin,
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'pfp': pfp,
      'name': name,
      'dob': dob,
      'ethnicity': ethnicity,
      'gender': gender,
      'educationLevel': educationLevel,
      'occupation': occupation,
      'interests': interests,
      'skills': skills,
      'preferences': preferences,
      'totalHours': totalHours,
      'availability': availability,
      'pastActivities': pastActivities,
      'currentActivities': currentActivities,
    };
  }
}
