// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'report_by_month_page.dart';
import 'report_by_type_page.dart';

class MonthTypeSelectionPage extends StatefulWidget {
  const MonthTypeSelectionPage({super.key});

  @override
  _MonthTypeSelectionPageState createState() => _MonthTypeSelectionPageState();
}

class _MonthTypeSelectionPageState extends State<MonthTypeSelectionPage> {
  String _selectedType = 'Volunteering';
  DateTime _pickedDate = DateTime(2000, 1);
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Report Type'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: const Text('Report By Month'),
            onTap: () {
              _showMonthPicker(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Report By Type'),
            onTap: () {
              setState(() {
                _pickedDate = DateTime(2000, 1);
                selected = true;
              });
            },
          ),
          const Divider(),
          if (_pickedDate == DateTime(2000, 1) && selected == true)
            _showTypeSelection(context),
          if (_pickedDate != DateTime(2000, 1) &&
              _selectedType == 'Volunteering' &&
              selected == true)
            Column(
              children: [
                Text(
                    'Selected Month: ${_pickedDate.month}/${_pickedDate.year}'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportByMonth(
                                selectedMonth: DateTime(
                                    _pickedDate.year, _pickedDate.month))));
                  },
                  child: const Text('Generate report for this month'),
                ),
              ],
            ),
          if (_selectedType != '' &&
              selected == true &&
              _pickedDate == DateTime(2000, 1))
            Column(
              children: [
                Text('Selected Type: $_selectedType'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReportByType(selectedType: _selectedType)));
                  },
                  child: const Text('Generate report for this type'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _showMonthPicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _pickedDate = pickedDate;
        _selectedType = 'Volunteering';
        selected = true;
      });
    }
  }

  Widget _showTypeSelection(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Type'),
      value: _selectedType,
      onChanged: (String? newValue) {
        setState(() {
          _selectedType = newValue!;
          _pickedDate = DateTime(2000, 1);
          selected = true;
        });
      },
      items: <String>['Volunteering', 'Training', 'Workshop']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a type';
        }
        return null;
      },
    );
  }
}
