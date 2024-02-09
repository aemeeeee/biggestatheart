import 'package:biggestatheart/Helpers/Firebase_Services/reports.dart';
import 'package:flutter/material.dart';

class ReportByType extends StatefulWidget {
  final String selectedType;
  const ReportByType({Key? key, required this.selectedType}) : super(key: key);

  @override
  ReportByTypeState createState() => ReportByTypeState();
}

class ReportByTypeState extends State<ReportByType> {
  final firebaseServiceReport = FirebaseServiceReport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteering Report by Type'),
      ),
      body: FutureBuilder(
        future: firebaseServiceReport.getDataByType(widget.selectedType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, int> dataMapping = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  Text('Report by Type : ${widget.selectedType}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  for (var entry in dataMapping.entries)
                    Text('${entry.key}: ${entry.value}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
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
