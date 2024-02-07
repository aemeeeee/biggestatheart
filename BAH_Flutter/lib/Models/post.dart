//This file stores classes that represent the major objects used
//These classes will be used to store the data returned from backend
import 'package:cloud_firestore/cloud_firestore.dart';

//Post class for user posts
class Post {
  final String postid;
  final String userid;
  final String title;
  final DateTime date;
  final String description;

//use of required keyword as none of these fields can be null
  Post(
      {required this.postid,
      required this.userid,
      required this.title,
      required this.date,
      required this.description});

  factory Post.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final post = snapshot.data();
    return Post(
      postid: snapshot.id,
      userid: post?['userid'] as String,
      title: post?['title'] as String,
      date: post?['date'].toDate() as DateTime,
      description: post?['description'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'postid': postid,
      'userid': userid,
      'title': title,
      'date': date,
      'description': description,
    };
  }
}
