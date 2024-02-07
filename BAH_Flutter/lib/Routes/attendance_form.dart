import 'package:biggestatheart/Helpers/Firebase_Services/activity_page.dart';
import 'package:flutter/material.dart';

class AttendanceForm extends StatefulWidget {
  final String activityID;
  const AttendanceForm({Key? key, required this.activityID}) : super(key: key);

  @override
  _AttendanceFormState createState() => _AttendanceFormState();
}

class _AttendanceFormState extends State<AttendanceForm> {
  final _formKey = GlobalKey<FormState>();

  late Future<List<String>> futureAttendeeList;
  late List<String> normalAttendeeList;

  void _loadData() {
    futureAttendeeList = FirebaseServiceActivity().getAttendeeList(widget.activityID);
  }

  @override
  void initState() async {
    super.initState();
    _loadData();
    normalAttendeeList = await futureAttendeeList;
  }

  Future<Map<String, String>>? futureUserMapping;
  Map<String, String>? userMapping = {};

  void mapUserKeytoID() async {
    futureUserMapping = FirebaseServiceActivity().getUserMapping(normalAttendeeList);
    userMapping = await futureUserMapping;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: normalAttendeeList.length,
      itemBuilder: (context, index) {
        String? userNameEmail = userMapping?.keys.elementAt(index);
        String? userID = userMapping?[userNameEmail]!;
        return CheckboxListTile(
          title: Text(userNameEmail!),
          value: false,
          onChanged: (isChecked) async {
            // setState(() {
            //   if (isChecked!) {
            //     attendedUsers.add(userID); // Add userID to the list
            //   } else {
            //     attendedUsers.remove(userID); // Remove userID from the list
            //   }
            // });
            await FirebaseServiceActivity().takeAttendanceActivity(widget.activityID, userMapping?[userID!] ?? '');
          },
        );
      },
    );
  }
}
