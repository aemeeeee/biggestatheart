// ignore_for_file: must_be_immutable

import 'package:biggestatheart/Routes/adminEvent/event_form.dart';
import 'package:biggestatheart/Routes/blog_feed_page.dart';
import 'package:biggestatheart/Routes/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/activity.dart';
import '../Models/user.dart' as user;
import 'activity_page.dart';
import 'adminReportPages/report_selection_page.dart';
import 'upload_post_page.dart';
import 'home_page.dart';
import '../Helpers/Firebase_Services/gallery_page.dart';
import 'honor_roll.dart';

class GalleryPage extends StatefulWidget {
  user.User? currUser;
  GalleryPage({super.key});
  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  bool editPostRequestProcessing = false;
  bool deletePostRequestProcessing = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String currUserID = '';
  String newDescription = '';
  bool isAdmin = false;

  refreshCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const NoticeDialog(
          content: 'Not authorised. Please sign in again');
    } else {
      currUserID = auth.currentUser!.uid;
      print("Current User ID: $currUserID");
      return FutureBuilder(
          future: Future.wait([
            FirebaseServiceGallery().getActivities(),
            FirebaseServiceGallery().getUser(currUserID)
          ]),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Activity> activities = snapshot.data![0] as List<Activity>;
              widget.currUser = snapshot.data![1] as user.User;
              isAdmin = widget.currUser!.isAdmin;
              return Scaffold(
                appBar: AppBar(
                  leading: backButton(),
                  centerTitle: true,
                  title: const Text('Activity Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                  actions: [
                    addNewActivityButton(currUserID, refreshCallback),
                  ],
                ),
                body: galleryScreen(context, activities, refreshCallback),
                bottomNavigationBar: BottomAppBar(
                  child: isAdmin
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Visit home page to view profile
                            homePageButton(refreshCallback),
                            //Visit camera page to post sighting
                            galleryPageButton(),
                            //Visit isExpert application page to review/submit applications
                            blogFeedPageButton(),
                            //Visit waiting list page to verify/flag posts
                            reportPageButton(),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Visit home page to view profile
                            homePageButton(refreshCallback),
                            //Visit camera page to post sighting
                            galleryPageButton(),
                            blogFeedPageButton(),
                            //Visit isExpert application page to review/submit applications
                            certificateRequestPageButton(refreshCallback),
                            //visit notifications to read notifications
                          ],
                        ),
                ),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return const NoticeDialog(
                  content: 'Error fetching posts. Please try again!');
            } else {
              return const LoadingScreen();
            }
          }));
    }
  }

  Widget addNewActivityButton(String userID, Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
      onPressed: () {
        Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) => EventForm(userID: userID)),
          MaterialPageRoute(builder: (context) => HonorRollPage()),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget logoutButton() {
    return IconButton(
      icon: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
  }

  Widget homePageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.home, color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget galleryPageButton() {
    return IconButton(
      icon: const Icon(Icons.photo_album,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        refreshCallback();
      },
    );
  }

  Widget blogFeedPageButton() {
    return IconButton(
      icon: const Icon(Icons.article, color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlogFeedPage()),
        );
      },
    );
  }

  Widget uploadPostButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.library_add,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UploadPostPage()),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget certificateRequestPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.picture_as_pdf,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           ExpertApplicationPage(currUser: widget.currUser)),
        // ).then((value) => refreshCallback());
      },
    );
  }

  Widget reportPageButton() {
    return IconButton(
      icon: const Icon(Icons.data_exploration_outlined,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportSelectionPage()),
        );
      },
    );
  }

  Widget cardTitle(Activity activity) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Stack(
          children: [
            Text(
              activity.title.length > 60
                  ? '${activity.title.substring(0, 60)}...'
                  : activity.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 33, 53, 88),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget galleryLegend() {
    return const Padding(
        padding: EdgeInsets.only(left: 18, top: 10, right: 9),
        child: Row(children: [
          Text(
            "Key:",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(255, 60, 89, 139)),
          ),
          SizedBox(width: 8),
          CircleAvatar(
              radius: 7,
              backgroundColor: Color.fromARGB(255, 73, 155, 109),
              child: Icon(
                Icons.volunteer_activism,
                size: 10,
                color: Colors.white,
              )),
          SizedBox(width: 4),
          Text(
            "[ Volunteering ]",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Color.fromARGB(255, 73, 155, 109)),
          ),
          SizedBox(width: 10),
          CircleAvatar(
              radius: 7,
              backgroundColor: Color.fromARGB(255, 175, 103, 51),
              child: Icon(
                Icons.model_training,
                size: 10,
                color: Colors.white,
              )),
          SizedBox(width: 4),
          Text(
            "[ Training ]",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Color.fromARGB(255, 175, 103, 51)),
          ),
          SizedBox(width: 10),
          CircleAvatar(
              radius: 7,
              backgroundColor: Color.fromARGB(255, 152, 72, 85),
              child: Icon(
                Icons.question_mark_rounded,
                size: 10,
                color: Colors.white,
              )),
          SizedBox(width: 4),
          Text(
            "[ Workshop ]",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: Color.fromARGB(255, 152, 72, 85)),
          ),
        ]));
  }

  Widget galleryScreen(BuildContext context, List<Activity> activities,
      Function refreshCallback) {
    return SingleChildScrollView(
        child: SizedBox(
            child: Column(children: [
      galleryLegend(),
      GridView.builder(
          itemCount: activities.length,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 7.0,
            childAspectRatio: 3,
          ),
          itemBuilder: (context, index) {
            return activityCard(activities[index], refreshCallback);
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(12.0))
    ])));
  }

  Widget activityCard(Activity activity, Function refreshCallback) {
    return InkWell(
      onTap: () {
        // Handle the tap event here, such as navigating to a new screen
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivityPage(
                    activityID: activity.activityID,
                  )),
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 253, 254, 255),
        elevation: 4.5,
        shadowColor: const Color.fromARGB(255, 113, 165, 255),
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              dense: true,
              minVerticalPadding: 0,
              horizontalTitleGap: 0,
              visualDensity: const VisualDensity(vertical: -4, horizontal: 0),
              leading: CircleAvatar(
                radius: 8,
                backgroundColor: activity.type == 'Workshop'
                    ? const Color.fromARGB(255, 155, 91, 101)
                    : activity.type == 'Volunteering'
                        ? const Color.fromARGB(255, 73, 155, 109)
                        : const Color.fromARGB(255, 175, 103, 51),
                child: Icon(
                  activity.type == 'Workshop'
                      ? Icons.question_mark_rounded
                      : activity.type == 'Volunteering'
                          ? Icons.volunteer_activism
                          : Icons.model_training,
                  size: 10,
                  color: Colors.white,
                ),
              ),
            ),
            // Post Image
            cardTitle(activity),
            Container(
              margin: activity.title.length > 30
                  ? const EdgeInsets.only(top: 10)
                  : const EdgeInsets.only(top: 35),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.pin_drop,
                        size: 14,
                        color: Color.fromARGB(255, 51, 64, 113),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        activity.location,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 33, 53, 88),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return Container(
        alignment: Alignment.topLeft,
        child: IconButton(
            color: Colors.white,
            iconSize: 35,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }

  editPostRequestProcessingCallback() {
    setState(() {
      editPostRequestProcessing = !editPostRequestProcessing;
    });
  }

  deletePostRequestProcessingCallback() {
    setState(() {
      deletePostRequestProcessing = !deletePostRequestProcessing;
    });
  }

  changeIdCallback() {
    setState(() {});
  }
}
