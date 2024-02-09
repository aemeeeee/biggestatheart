import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Models/activity.dart';

class FirebaseServiceReport {
  Future<Map<String, int>> getDataByMonth(DateTime selectedMonth) async {
    final nextMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
    int activityCount = 0;
    int volunteerCount = 0;
    int volunteerHourCount = 0;
    Map<String, int> dataValues = {
      'activitiesNumber': 0,
      'totalVolunteeringHours': 0,
      'volunteerNumber': 0
    };
    FirebaseFirestore.instance
        .collection('activities')
        .where('date',
            isLessThan: nextMonth, isGreaterThanOrEqualTo: selectedMonth)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Activity currActivity = Activity.fromFireStore(doc, null);
        activityCount++;
        volunteerCount += currActivity.attendeeCount;
        volunteerHourCount += currActivity.numHours;
      }
      dataValues.update('activitiesNumber', (value) => activityCount);
      dataValues.update(
          'totalVolunteeringHours', (value) => volunteerHourCount);
      dataValues.update('volunteerNumber', (value) => volunteerCount);
    });
    return dataValues;
  }

  Future<Map<String, int>> getDataByType(String type) async {
    int activityCount = 0;
    int volunteerCount = 0;
    int volunteerHourCount = 0;
    Map<String, int> dataValues = {
      'activitiesNumber': 0,
      'totalVolunteeringHours': 0,
      'volunteerNumber': 0
    };
    FirebaseFirestore.instance
        .collection('activities')
        .where('type', isEqualTo: type)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Activity currActivity = Activity.fromFireStore(doc, null);
        activityCount++;
        volunteerCount += currActivity.attendeeCount;
        volunteerHourCount += currActivity.numHours;
      }
      dataValues.update('activitiesNumber', (value) => activityCount);
      dataValues.update(
          'totalVolunteeringHours', (value) => volunteerHourCount);
      dataValues.update('volunteerNumber', (value) => volunteerCount);
    });
    return dataValues;
  }
}
