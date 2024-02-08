import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/post.dart';
import '../../Models/user.dart';

class FirebaseServiceBlog {
  Future<List<Post>> getAllPosts() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('posts').get();
    List<Post> postList = querySnapshot.docs.map((doc) {
      return Post.fromFireStore(doc, null);
    }).toList();
    return postList;
  }

  Future<User> getUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User currUser = User.fromFireStore(querySnapshot, null);
    return currUser;
  }
}
