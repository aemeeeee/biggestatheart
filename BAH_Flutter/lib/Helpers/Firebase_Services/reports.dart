import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/activity.dart';

class FirebaseServiceReport {
  Future<Map<String, int>> getDataByMonth(DateTime selectedMonth) async {
    final nextMonth = selectedMonth.month != 12
        ? DateTime(selectedMonth.year, selectedMonth.month + 1)
        : DateTime(selectedMonth.year + 1, 1);
    int activityCount = 0;
    int volunteerCount = 0;
    int volunteerHourCount = 0;
    Map<String, int> dataValues = {
      'Number of activities': 0,
      'Total Volunteering Hours': 0,
      'Number of volunteers': 0
    };

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('activities')
        .where('date',
            isLessThan: nextMonth, isGreaterThanOrEqualTo: selectedMonth)
        .get();

    for (var doc in querySnapshot.docs) {
      Activity currActivity = Activity.fromFireStore(doc, null);
      activityCount++;
      volunteerCount += currActivity.attendeeCount;
      volunteerHourCount += currActivity.numHours;
    }

    dataValues.update('Number of activities', (value) => activityCount);
    dataValues.update(
        'Total Volunteering Hours', (value) => volunteerHourCount);
    dataValues.update('Number of volunteers', (value) => volunteerCount);

    return dataValues;
  }

  Future<Map<String, int>> getDataByType(String type) async {
    int activityCount = 0;
    int volunteerCount = 0;
    int volunteerHourCount = 0;
    Map<String, int> dataValues = {
      'Number of activities': 0,
      'Total Volunteering Hours': 0,
      'Number of volunteers': 0
    };

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('activities')
        .where('type', isEqualTo: type)
        .get();

    for (var doc in querySnapshot.docs) {
      Activity currActivity = Activity.fromFireStore(doc, null);
      activityCount++;
      volunteerCount += currActivity.attendeeCount;
      volunteerHourCount += currActivity.numHours;
    }

    dataValues.update('Number of activities', (value) => activityCount);
    dataValues.update(
        'Total Volunteering Hours', (value) => volunteerHourCount);
    dataValues.update('Number of volunteers', (value) => volunteerCount);

    return dataValues;
  }
}
