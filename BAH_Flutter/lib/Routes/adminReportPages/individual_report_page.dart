import 'package:flutter/material.dart';
import '../../Models/user.dart';
import '../../Models/activity.dart';
import '../../Helpers/Firebase_Services/individual_report_page.dart';

class IndividualReportPage extends StatefulWidget {
  final User currVolunteer;

  const IndividualReportPage({Key? key, required this.currVolunteer})
      : super(key: key);

  @override
  _IndividualReportPageState createState() => _IndividualReportPageState();
}

class _IndividualReportPageState extends State<IndividualReportPage> {
  late List<Activity> _activityList;
  late DateTime _startDate;
  late DateTime _endDate;
  List<Activity> _filteredActivities = [];

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireBaseServiceIndividualReportPage()
          .getCurrActivities(widget.currVolunteer.pastActivities!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No activities found'));
        } else {
          _activityList = snapshot.data as List<Activity>;
          return Scaffold(
            appBar: AppBar(
              title:
                  Text('Individual Report: ${widget.currVolunteer.username}'),
            ),
            body: Column(
              children: [
                _buildTopSection(),
                _buildMiddleSection(),
                _buildBottomSection(),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildTopSection() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Total Volunteering Hours: ${widget.currVolunteer.totalHours}'),
            Text(
                'Total Participated Activities: ${widget.currVolunteer.pastActivities!.length}'),
          ],
        ));
  }

  Widget _buildMiddleSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('From: ${_formatDate(_startDate)}'),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final newStartDate = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (newStartDate != null) {
                      setState(() {
                        _startDate = DateTime(newStartDate.year,
                            newStartDate.month, newStartDate.day, 0, 0);
                      });
                    }
                  },
                  child: const Text('Select Start Time'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text('To: ${_formatDate(_endDate)}'),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final newEndDate = await showDatePicker(
                      context: context,
                      initialDate: _endDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (newEndDate != null) {
                      setState(() {
                        _endDate = DateTime(newEndDate.year, newEndDate.month,
                            newEndDate.day, 23, 59);
                      });
                    }
                  },
                  child: const Text('Select End Time'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to handle viewing attendance report
                    if (_startDate.isAfter(_endDate)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Start date cannot be after end date. Please try again.'),
                        ),
                      );
                      return;
                    } else {
                      List<Activity> tempList = _activityList
                          .where((activity) =>
                              activity.date.isAfter(_startDate) &&
                              activity.date.isBefore(_endDate))
                          .toList();
                      tempList.sort((a, b) => a.date.compareTo(b.date));
                      setState(() {
                        _filteredActivities = tempList;
                      });
                    }
                  },
                  child: const Text('View Attendance Report'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Expanded(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    children: const [
                      TableCell(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Activity',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                      TableCell(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                      TableCell(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Hours',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                    ],
                  ),
                  for (var activity in _filteredActivities)
                    TableRow(
                      children: [
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(activity.title),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_formatDate(activity.date)),
                        )),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${activity.numHours}'),
                        )),
                      ],
                    ),
                ],
              )),
          if (_filteredActivities.isEmpty)
            const Center(child: Text('No records found')),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }
}
