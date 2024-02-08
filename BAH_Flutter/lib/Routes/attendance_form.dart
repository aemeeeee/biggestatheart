import 'package:biggestatheart/Helpers/Firebase_Services/activity_page.dart';
import 'package:flutter/material.dart';

class AttendanceForm extends StatefulWidget {
  final String activityID;
  const AttendanceForm({Key? key, required this.activityID}) : super(key: key);

  @override
  _AttendanceFormState createState() => _AttendanceFormState();
}

class _AttendanceFormState extends State<AttendanceForm> {

  late Future<List<String>> futureAttendeeList;
  late Map<String, String> userMapping = {};
  //Map<String, bool> checkedAttendees = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    futureAttendeeList = FirebaseServiceActivity().getAttendeeList(widget.activityID);
    userMapping = await FirebaseServiceActivity().getUserMapping(await futureAttendeeList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Form'),
      ),
      body: FutureBuilder<List<String>>(
        future: futureAttendeeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<String> attendeeList = snapshot.data!;
            // for (String userID in attendeeList) {
            //   checkedAttendees[userID] = false; // Initialize all checkboxes as unchecked initially
            // };
            return ListView.builder(
              itemCount: attendeeList.length,
              itemBuilder: (context, index) {
                String userID = attendeeList[index];
                String userNameEmail = userMapping.keys.firstWhere(
                  (key) => userMapping[key] == userID,
                  orElse: () => 'Unknown User',
                );
                return CheckboxListTile(
                  title: Text(userNameEmail),
                  //value: checkedAttendees[userID] ?? false,
                  value: false,
                  // onChanged: (bool? value) {
                  //   setState(() {
                  //     checkedAttendees[userID] = value ?? false; // Update the state of the checkbox
                  //   });
                  // },
                  onChanged: (bool? value) async {
                    setState(() {
                      value = value!; // Update the state of the checkbox
                    });
                    await FirebaseServiceActivity().takeAttendanceActivity(
                      widget.activityID,
                      userID,
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}