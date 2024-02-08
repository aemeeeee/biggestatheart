//This file stores classes that represent the major objects used
//These classes will be used to store the data returned from backend
import 'package:cloud_firestore/cloud_firestore.dart';

//Post class for user posts
class Activity {
  final String activityID;
  final String title;
  final int attendeeCount;
  final List<String> attendeeList;
  final DateTime date;
  final String description;
  final bool isCompleted;
  final String location;
  final String organiser;
  final String type;
  final int maxAttendees;
  final List<String> attendanceList;

//use of required keyword as none of these fields can be null
  Activity(
      {required this.activityID,
      required this.title,
      required this.attendeeCount,
      required this.attendeeList,
      required this.date,
      required this.description,
      required this.isCompleted,
      required this.location,
      required this.organiser,
      required this.type,
      required this.maxAttendees,
      required this.attendanceList}); // to do: close enrollment upon reaching maxAttendees

  factory Activity.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final activity = snapshot.data();
    final List<dynamic> attendeeListDynamic = activity?['attendeeList'] ?? [];

    // Explicitly cast each element in attendeeList from dynamic to String
    final List<String> attendeeList = attendeeListDynamic.map((dynamic item) {
      if (item is String) {
        return item;
      } else {
        // Handle the case where the item is not a string (e.g., null or other types)
        return 'dummyUserID'; // or any default value you prefer
      }
    }).toList();

    // Explicitly cast each element in attendanceList from dynamic to String
    final List<dynamic> attendanceListDynamic = activity?['attendanceList'] ?? [];
    final List<String> attendanceList = attendanceListDynamic.map((dynamic item) {
      if (item is String) {
        return item;
      } else {
        // Handle the case where the item is not a string (e.g., null or other types)
        return 'dummyUserID'; // or any default value you prefer
      }
    }).toList();
    

    final int attendeeCount = activity?['attendeeCount'] == null
        ? 0
        : activity?['attendeeCount'] as int;
    final int maxAttendees = activity?['maxAttendees'] == null
        ? 0
        : activity?['maxAttendees'] as int;
    return Activity(
      activityID: snapshot.id,
      title: activity?['title'] as String,
      attendeeCount: attendeeCount,
      attendeeList: attendeeList, // Use the converted list
      date: activity?['date'].toDate() as DateTime,
      description: activity?['description'] as String,
      isCompleted: activity?['isCompleted'] as bool,
      location: activity?['location'] as String,
      organiser: activity?['organiser'] as String,
      type: activity?['type'] as String,
      maxAttendees: maxAttendees,
      attendanceList: attendanceList,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'attendeeCount': attendeeCount,
      'attendeeList': attendeeList,
      'date': date,
      'description': description,
      'isCompleted': isCompleted,
      'location': location,
      'organiser': organiser,
      'type': type,
      'maxAttendees': maxAttendees,
      'attendanceList': attendanceList,
    };
  }
}
