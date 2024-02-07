import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'event.dart';

class EventForm extends StatefulWidget {
  final void Function(Event) onSubmit;
  const EventForm({Key? key, required this.onSubmit}) : super(key:key);
  
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();

  String? _eventName;
  String? _eventDescription;
  String? _location;
  DateTime? _date;
  int? _numberOfVolunteersNeeded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Event'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Event Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _eventName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Event Description'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter event description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _eventDescription = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value;
                },
              ),
              GestureDetector(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _date ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _date = pickedDate;
                    });
                  }
                },
                child: ListTile(
                  title: Text('Date'),
                  subtitle: Text(
                    _date == null
                        ? 'Select Date'
                        : 'Date: ${_date!.day}/${_date!.month}/${_date!.year}',
                  ),
                  trailing: Icon(Icons.calendar_today),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number of Volunteers Needed'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of volunteers needed';
                  }
                  return null;
                },
                onSaved: (value) {
                  _numberOfVolunteersNeeded = int.tryParse(value!);
                },
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final Event newEvent = Event(
        eventName: _eventName!,
        location: _location!,
        time: _date!,
        description: _eventDescription!,
        numberOfVolunteersNeeded: _numberOfVolunteersNeeded!,
      );
      _formKey.currentState!.reset();
      widget.onSubmit(newEvent);
      _addEventToFirestore(newEvent);
      Navigator.pop(context);
    }
  }
  void _addEventToFirestore(Event event) async {
    try {
      CollectionReference eventsCollection = FirebaseFirestore.instance.collection('events');
      await eventsCollection.doc(event.eventName).set({
        'eventName': event.eventName,
        'location': event.location,
        'time': event.time,
        'description': event.description,
        'numberOfVolunteersNeeded': event.numberOfVolunteersNeeded,
      });
    } catch (e) {
      print('Error adding event to Firestore: $e');
    }
  }
}

