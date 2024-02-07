import 'package:biggestatheart/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/activity.dart';

//class which stores the functions responsible for Firebase backend communication
class FirebaseServiceHome {
  Future<User> getUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User currUser = User.fromFireStore(querySnapshot, null);
    return currUser;
  }

  Future<List<Activity>> getCurrActivities(List<String> docIDs) async {
    List<Activity> currActivites = [];
    for (var id in docIDs) {
      DocumentSnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('activities')
              .doc(id)
              .get();
      Activity activity = Activity.fromFireStore(querySnapshot, null);
      currActivites.add(activity);
    }
    return currActivites;
  }
}
