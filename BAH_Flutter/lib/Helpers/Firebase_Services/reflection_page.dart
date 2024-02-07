import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/post.dart';
import '../../Models/user.dart';

class FirebaseServicePost {
  Future<Post> getPost(String postID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('posts').doc(postID).get();
    Post currPost = Post.fromFireStore(querySnapshot, null);
    return currPost;
  }

  Future<User> getUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User currUser = User.fromFireStore(querySnapshot, null);
    return currUser;
  }
}
