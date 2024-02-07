import 'package:flutter/material.dart';
import 'event.dart'; // Import the Event model

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.eventName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Location: ${event.location}',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              'Time: ${event.time}',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
