import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("yyyy-MM-dd");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }
}

class PickerDateTimeRoute extends StatefulWidget {
  final Function dateCallback;
  final Function timeCallback;
  const PickerDateTimeRoute(
      {Key? key, required this.dateCallback, required this.timeCallback})
      : super(key: key);

  @override
  PickerDateTimeRouteState createState() => PickerDateTimeRouteState();
}

class PickerDateTimeRouteState extends State<PickerDateTimeRoute> {
  late Future<DateTime?> selectedDate;
  String date = "";

  late Future<TimeOfDay?> selectedTime;
  String time = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 82, 108, 175))),
                child: const Text("Select date of sighting",
                    style: TextStyle(color: Color.fromARGB(255, 82, 108, 175))),
                onPressed: () {
                  showDialogPicker(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 82, 108, 175))),
                child: const Text("Select time of sighting",
                    style: TextStyle(color: Color.fromARGB(255, 82, 108, 175))),
                onPressed: () {
                  showDialogTimePicker(context);
                },
              ),
            )
          ],
        ));
  }

  void showDialogPicker(BuildContext context) {
    selectedDate = showDatePicker(
      context: context,
      helpText: 'Select the date of sighting',
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              // primary: MyColors.primary,
              primary: Color.fromARGB(255, 51, 64, 113),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedDate.then((value) {
      setState(() {
        if (value == null) return;
        date = Utils.getFormattedDateSimple(value.millisecondsSinceEpoch);
        widget.dateCallback(date);
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }

  void showDialogTimePicker(BuildContext context) {
    selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              // primary: MyColors.primary,
              primary: Color.fromARGB(255, 51, 64, 113),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    );
    selectedTime.then((value) {
      setState(() {
        if (value == null) return;
        time = "${value.hour}:${value.minute}:00";
        widget.timeCallback(time);
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
