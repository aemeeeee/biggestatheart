import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServiceUser {
  // query user data such as 
  Future<List<String>> getUserDataByField(String field) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .get();

    // Map to store counts of unique values
    Map<String, int> valueCounts = {};

    for (var userid in querySnapshot.docs) {
      String value = userid.get(field);
      if (valueCounts.containsKey(value)) {
        valueCounts[value] = valueCounts[value]! + 1;
      } else {
        valueCounts[value] = 1;
      }
    }
    // Build the concatenated result string
    List<String> result = [];
    valueCounts.forEach((value, countVal) {
      String temp = '$value $countVal'; // [ 'Chinese 3', 'Indian 2', 'Malay 1']
      result.add(temp);
    });

    // Trim trailing space and return the result
    return result;
  }
}