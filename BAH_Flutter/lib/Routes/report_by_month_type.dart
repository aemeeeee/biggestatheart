import 'package:biggestatheart/Helpers/Firebase_Services/reports.dart';
import 'package:flutter/material.dart';

class ReportByMonth extends StatefulWidget {
  final DateTime selectedMonth;
  const ReportByMonth({Key? key, required this.selectedMonth})
      : super(key: key);

  @override
  ReportByMonthState createState() => ReportByMonthState();
}

class ReportByMonthState extends State<ReportByMonth> {
  int activitiesNumber = 0;
  int totalVolunteeringHours = 0;
  int volunteerNumber = 0;
  final firebaseServiceReport = FirebaseServiceReport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteering Report by Month'),
      ),
      body: FutureBuilder(
        future: firebaseServiceReport.getDataByMonth(selectedMonth),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, int> dataMapping = snapshot.data!;
            // for (String userID in attendeeList) {
            //   checkedAttendees[userID] = false; // Initialize all checkboxes as unchecked initially
            // };
            return Column(
              children: [Text(dataMapping)],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
