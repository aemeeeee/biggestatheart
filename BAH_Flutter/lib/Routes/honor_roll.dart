import 'package:flutter/material.dart';
import 'package:biggestatheart/Helpers/Firebase_Services/user_data.dart';

class HonorRollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honor Roll'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: FirebaseServiceUser().getHighestRecordVolunteer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Volunteer with Most Activities: ',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      snapshot.data!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28),
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
