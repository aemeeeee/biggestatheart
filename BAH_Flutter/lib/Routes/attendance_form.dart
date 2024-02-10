// ignore_for_file: use_build_context_synchronously

import 'package:biggestatheart/Helpers/Firebase_Services/activity_page.dart';
import 'package:biggestatheart/Routes/gallery_page.dart';
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
  List<bool> checkedAttendees = [];
  List<String> bufferList = [];

  @override
  void initState() {
    super.initState();
    loadData();
    for (int i = 0; i < 10000; i++) {
      checkedAttendees.add(false);
    }
  }

  void loadData() async {
    futureAttendeeList =
        FirebaseServiceActivity().getAttendeeList(widget.activityID);
    userMapping = await FirebaseServiceActivity()
        .getUserMapping(await futureAttendeeList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Form'),
      ),
      body: FutureBuilder<List<String>>(
        future: futureAttendeeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<String> attendeeList = snapshot.data!;
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
                  value: checkedAttendees[index],
                  onChanged: (bool? newValue) async {
                    setState(() {
                      checkedAttendees[index] = newValue!;
                      if (newValue && !bufferList.contains(userID)) {
                        bufferList.add(userID);
                      } else {
                        bufferList.remove(userID);
                      }
                    });
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: submitButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseServiceActivity().submitAttendance(
          widget.activityID,
          bufferList,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return GalleryPage();
        }));
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 168, 49, 85)),
      ),
      child: const Text('Submit attendance and mark as complete',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
