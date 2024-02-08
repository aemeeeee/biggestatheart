import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/activity.dart';
import '../../Models/user.dart';

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

  Future<String> enrollActivity(String activityID, String userID) async {
    try {
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
          Activity currActivity =
              Activity.fromFireStore(activitySnapshot, null);
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
        } else {
          return "Activity or user does not exist.";
        }
      });
      return "Enrollment successful.";
    } catch (error) {
      return "Error: $error";
    }
  }

  Future<User> getUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    User currUser = User.fromFireStore(querySnapshot, null);
    return currUser;
  }

  Future<void> takeAttendanceActivity(String activityID, String userID) async {
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
        // verify userID and activityID
        Activity currActivity = Activity.fromFireStore(activitySnapshot, null);
        String currActivityID = currActivity.activityID;
        User currUser = User.fromFireStore(userSnapshot, null);
        String currUserID = currUser.userid;

        // add userID to attendanceList
        List<String> currAttendanceList = currActivity.attendanceList;
        currAttendanceList.add(currUserID);
        transaction.update(activityRef, <String, dynamic>{
          'attendanceList': currAttendanceList,
          'attendanceCount': currAttendanceList.length
        });

        // add activityID to user's pastActivities and remove from currentActivities
        List<String>? currentActivitiesList = currUser.currentActivities;
        List<String>? pastActivitiesList = currUser.pastActivities;
        currentActivitiesList?.remove(currActivityID);
        //pastActivitiesList?.add(currActivityID); //duplicate from last line
        transaction.update(userRef, <String, dynamic>{
          'currentActivities': currentActivitiesList,
        });
        transaction.update(userRef, <String, dynamic>{
          'pastActivities': FieldValue.arrayUnion([currActivityID]), // only support one-time activity
        });
      }
    });
  }

  Future<void> createActivity(
      String title,
      String location,
      DateTime date,
      String description,
      int maxAttendees,
      String organiser,
      String type,
      int numHours) async {
    CollectionReference activityCollection =
        FirebaseFirestore.instance.collection('activities');
    activityCollection.add({
      'title': title,
      'attendeeCount': 0,
      'attendeeList': [],
      'date': date,
      'description': description,
      'isCompleted': false,
      'location': location,
      'organiser': organiser,
      'type': type,
      'maxAttendees': maxAttendees,
      'attendanceList': [],
      'numHours': numHours,
    });
    // .then((value) => print("Activity Added"))
    // .catchError((error) => print("Failed to add activity: $error"));
  }

  Future<List<String>> getAttendeeList(String activityID) async {
    DocumentSnapshot<Map<String, dynamic>> activitySnapshot =
        await FirebaseFirestore.instance
          .collection('activities')
          .doc(activityID)
          .get();

    if (activitySnapshot.exists) {
      Activity activity = Activity.fromFireStore(activitySnapshot, null);
      return activity.attendeeList;
    } else {
      return [];
    }
  }

  // {(userName, email) : userID}
  Future<Map<String, String>> getUserMapping(List<String> userIDList) async {
    Map<String, String> userMapping = {};
    for (String userID in userIDList) {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
            .collection('users')
            .doc(userID)
            .get();
      if (userSnapshot.exists) {
        User user = User.fromFireStore(userSnapshot, null);
        String userKey = "${user.name} - ${user.email}";
        userMapping[userKey] = userID;
      }
    }
    return userMapping;
  }
}
