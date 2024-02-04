import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/activity.dart';

class FirebaseServiceActivity {
  Future<Activity> getActivity(String activityID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('activities')
            .doc(activityID)
            .get();
    Activity currActivity = Activity.fromFireStore(querySnapshot, null);
    return currActivity;
  }

  Future<void> enrollActivity(String activityID, String userID) async {
    DocumentReference<Map<String, dynamic>> activityRef =
        FirebaseFirestore.instance.collection('activities').doc(activityID);
    DocumentReference<Map<String, dynamic>> userRef =
        FirebaseFirestore.instance.collection('users').doc(userID);
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot<Map<String, dynamic>> activitySnapshot =
          await transaction.get(activityRef);
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await transaction.get(userRef);
      if (activitySnapshot.exists && userSnapshot.exists) {
        Activity currActivity = Activity.fromFireStore(activitySnapshot, null);
        List<String> currAttendeeList = currActivity.attendeeList;
        String currActivityID = currActivity.activityID;
        currAttendeeList.add(userID);
        transaction.update(activityRef, <String, dynamic>{
          'attendeeList': currAttendeeList,
          'attendeeCount': currAttendeeList.length
        });
        transaction.update(userRef, <String, dynamic>{
          'currentActivities': FieldValue.arrayUnion([currActivityID])
        });
      }
    });
  }
}
