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
  final firebaseServiceReport = FirebaseServiceReport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteering Report by Month'),
      ),
      body: FutureBuilder(
        future: firebaseServiceReport.getDataByMonth(widget.selectedMonth),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, int> dataMapping = snapshot.data!;
            // for (String userID in attendeeList) {
            //   checkedAttendees[userID] = false; // Initialize all checkboxes as unchecked initially
            // };
            return Center(
              child: Column(
                children: [
                  for (var entry in dataMapping.entries)
                    Text('${entry.key}: ${entry.value}')
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
