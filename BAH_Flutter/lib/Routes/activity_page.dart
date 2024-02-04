import 'package:flutter/material.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/user.dart';
import '../Helpers/Firebase_Services/activity_page.dart';

class ActivityPage extends StatefulWidget {
  final String activityID;
  final User currUser;
  const ActivityPage({
    Key? key,
    required this.activityID,
    required this.currUser,
  }) : super(key: key);
  @override
  ActivityPageState createState() => ActivityPageState();
}

class ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseServiceActivity().getActivity(widget.activityID),
        builder: ((context, snapshotPost) {
          if (snapshotPost.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshotPost.data!.title),
                backgroundColor: const Color.fromARGB(255, 65, 90, 181),
              ),
              body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Activity Details",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromARGB(255, 51, 64, 113)),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 7),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color.fromARGB(255, 51, 64, 113)),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, top: 5, right: 20, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshotPost.data!.description,
                          )),
                      Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15, bottom: 7),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Location",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 51, 64, 113)),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshotPost.data!.location,
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15, bottom: 7),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 51, 64, 113)),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshotPost.data!.date.toString(),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15, bottom: 7),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Organiser",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 51, 64, 113)),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshotPost.data!.organiser,
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 15, bottom: 7),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 51, 64, 113)),
                              )),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshotPost.data!.type,
                              )),
                          // Enroll button
                          if (!widget.currUser.currentActivities!
                              .contains(widget.activityID))
                            enrollButton(),
                        ],
                      ),
                    ],
                  ))),
            );
          } else if (snapshotPost.hasError) {
            return const NoticeDialog(
                content: 'Activity not found! Please try again');
          } else {
            return const LoadingScreen();
          }
        }));
  }

  Widget enrollButton() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          FirebaseServiceActivity()
              .enrollActivity(widget.activityID, widget.currUser.userid);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        child: const Text('Enroll'),
      ),
    );
  }
}
