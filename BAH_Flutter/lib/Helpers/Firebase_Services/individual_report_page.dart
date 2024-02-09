import 'package:biggestatheart/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:biggestatheart/Models/activity.dart';

class FireBaseServiceIndividualReportPage {
  Future<User> getUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User currUser = User.fromFireStore(querySnapshot, null);
    return currUser;
  }

  Future<List<Activity>> getCurrActivities(List<String> activityIDs) async {
    List<Activity> currActivites = [];
    for (var id in activityIDs) {
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
