import 'package:flutter/material.dart';

class Event {
  final String eventName;
  final String location;
  final DateTime time;
  final String description;
  final int numberOfVolunteersNeeded;

  Event({
    required this.eventName,
    required this.location,
    required this.time,
    required this.description,
    required this.numberOfVolunteersNeeded,
  });
}
