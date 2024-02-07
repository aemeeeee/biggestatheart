import 'package:biggestatheart/Helpers/Firebase_Services/activity_page.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  //final void Function(Event) onSubmit;
  //const EventForm({Key? key, required this.onSubmit}) : super(key:key);
  const EventForm({Key? key}) : super(key:key);

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
      _formKey.currentState!.reset();
      FirebaseServiceActivity().createActivity(_eventName!, _location!, _date!, _eventDescription!, _numberOfVolunteersNeeded!);
      Navigator.pop(context);
    }
  }
}

