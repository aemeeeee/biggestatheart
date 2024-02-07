import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/post.dart';

class FirebaseServiceUploasPost {
  Future<void> uploadPost(
    String userid,
    String title,
    DateTime date,
    String description,
  ) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    return posts
        .add({
          'userid': userid,
          'title': title,
          'date': date,
          'description': description,
        })
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add post: $error"));
  }
}
