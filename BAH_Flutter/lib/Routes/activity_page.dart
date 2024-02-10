// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/user.dart' as userModel;
import '../Helpers/Firebase_Services/activity_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/activity.dart';
import 'package:intl/intl.dart';
import 'attendance_form.dart';

class ActivityPage extends StatefulWidget {
  final String activityID;
  userModel.User? currUser;
  ActivityPage({
    Key? key,
    required this.activityID,
  }) : super(key: key);
  @override
  ActivityPageState createState() => ActivityPageState();
}

class ActivityPageState extends State<ActivityPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String currUserID = '';
  bool isAdmin = false;
  List<String> currActivityList = [];
  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const NoticeDialog(
          content: 'Not authorised. Please sign in again');
    } else {
      currUserID = auth.currentUser!.uid;
      print("Current User ID: $currUserID");
      return FutureBuilder(
          future: Future.wait([
            FirebaseServiceActivity().getActivity(widget.activityID),
            FirebaseServiceActivity().getUser(currUserID)
          ]),
          builder: ((context, snapshotPost) {
            if (snapshotPost.hasData) {
              Activity currActivity = snapshotPost.data![0] as Activity;
              widget.currUser = snapshotPost.data![1] as userModel.User;
              isAdmin = widget.currUser!.isAdmin;
              currActivityList = widget.currUser!.currentActivities == null
                  ? []
                  : widget.currUser!.currentActivities!;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Activity Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255))),
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                ),
                body: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            currActivity.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 15, bottom: 7),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 51, 64, 113)),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 20, top: 5, right: 20, bottom: 5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              currActivity.description,
                            )),
                        Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 7),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Location",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 51, 64, 113)),
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, right: 20, bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  currActivity.location,
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 7),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Date",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 51, 64, 113)),
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, right: 20, bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  DateFormat('d MMM yyyy, hh:mm a')
                                      .format(currActivity.date),
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 7),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Type",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 51, 64, 113)),
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, right: 20, bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  currActivity.type,
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15, bottom: 7),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Duration",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 51, 64, 113)),
                                )),
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 5, right: 20, bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${currActivity.numHours} hours",
                                )),

                            // Enroll button
                            const SizedBox(height: 20),
                            isAdmin
                                ? widget.currUser!.currentActivities!
                                        .contains(widget.activityID)
                                    ? takeAttendanceButton(
                                        context, widget.activityID)
                                    : assignButton(currUserID)
                                : currActivityList.contains(widget.activityID)
                                    ? const Text(
                                        "You are already enrolled in this activity.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 51, 64, 113)))
                                    : enrollButton(currUserID),
                          ],
                        ),
                      ],
                    ))),
              );
            } else if (snapshotPost.hasError) {
              return const NoticeDialog(
                  content: 'Activity not found! Please try again');
            } else {
              return const LoadingScreen();
            }
          }));
    }
  }

  Widget enrollButton(String userid) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () async {
          FirebaseServiceActivity()
              .enrollActivity(widget.activityID, userid)
              .then((message) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Enrollment Status"),
                  content: Text(message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        if (message == "Enrollment successful.") {
                          Navigator.pop(
                              context); // Navigate back to the gallery page
                        }
                      },
                      child: const Text("Back to Activity Gallery"),
                    ),
                  ],
                );
              },
            );
          });
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        child: const Text('Enroll'),
      ),
    );
  }

  Widget assignButton(String userid) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () async {
          FirebaseServiceActivity()
              .assignActivity(widget.activityID, userid)
              .then((message) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Assignment Status"),
                  content: Text(message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        if (message == "Assignment successful.") {
                          Navigator.pop(
                              context); // Navigate back to the gallery page
                        }
                      },
                      child: const Text("Back to Activity Gallery"),
                    ),
                  ],
                );
              },
            );
          });
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        child: const Text('Assign'),
      ),
    );
  }
}

Widget takeAttendanceButton(BuildContext context, activityID) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: ElevatedButton(
      onPressed: () async {
        // Navigate to the AttendanceForm page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttendanceForm(activityID: activityID),
          ),
        );
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      child: const Text('Take Attendance'),
    ),
  );
}
