import '../Models/species.dart';
import 'package:selectable_list/selectable_list.dart';
import 'package:flutter/material.dart';

class ClassPicker extends StatefulWidget {
  final Function classCallback;
  const ClassPicker({Key? key, required this.classCallback}) : super(key: key);

  @override
  ClassPickerState createState() => ClassPickerState();
}

class ClassPickerState extends State<ClassPicker> {
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return SelectableList<SpeciesClassification, String?>(
      items: classes,
      itemBuilder: (context, class_, selected, onTap) => ListTile(
          title: Text(class_.classification),
          subtitle: Text(class_.description),
          selected: selected,
          onTap: onTap),
      valueSelector: (class_) => class_.classification,
      selectedValue: selectedClass,
      onItemSelected: (class_) {
        setState(() {
          selectedClass = class_.classification;
        });
        widget.classCallback(selectedClass);
      },
      onItemDeselected: (class_) {
        setState(() {
          selectedClass = '';
        });
        widget.classCallback(selectedClass);
      },
    );
  }
}
