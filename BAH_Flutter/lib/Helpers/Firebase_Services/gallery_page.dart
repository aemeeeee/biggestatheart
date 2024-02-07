import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/activity.dart';
import '../../Models/user.dart';

class FirebaseServiceGallery {
  Future<List<Activity>> getActivities() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('activities')
        .where('isCompleted', isEqualTo: false)
        .get();
    List<Activity> activityList = querySnapshot.docs.map((doc) {
      return Activity.fromFireStore(doc, null);
    }).toList();
    return activityList;
  }

  Future<User> getUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User currUser = User.fromFireStore(querySnapshot, null);
    return currUser;
  }
}
