import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:biggestatheart/Helpers/Firebase_Services/user_data.dart';

class HonorRollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Honor Roll'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: FirebaseServiceUser().getHighestRecordVolunteer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Volunteer with Most Activities: ',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      snapshot.data!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
