import 'package:biggestatheart/Routes/login.dart';
import 'package:flutter/material.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/activity.dart';
import '../Models/user.dart';
import 'activity_page.dart';
import 'home_page.dart';
import 'camera_page.dart';
import 'expert_application_page.dart';
import 'waiting_list_page.dart';
import '../Helpers/Firebase_Services/gallery_page.dart';

class GalleryPage extends StatefulWidget {
  final User currUser;
  const GalleryPage({super.key, required this.currUser});
  @override
  GalleryPageState createState() => GalleryPageState();
}

class GalleryPageState extends State<GalleryPage> {
  bool editPostRequestProcessing = false;
  bool deletePostRequestProcessing = false;

  String newDescription = '';

  refreshCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseServiceGallery().getActivities(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Sighting Gallery'),
                backgroundColor: const Color.fromARGB(255, 65, 90, 181),
                actions: [logoutButton()],
              ),
              body: galleryScreen(context, snapshot.data!, refreshCallback),
              bottomNavigationBar: BottomAppBar(
                child: widget.currUser.isAdmin
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Visit home page to view profile
                          homePageButton(refreshCallback),
                          //Visit camera page to post sighting
                          cameraPageButton(refreshCallback),
                          //Visit isExpert application page to review/submit applications
                          isExpertApplicationPageButton(refreshCallback),
                          //Visit waiting list page to verify/flag posts
                          waitingListPageButton(refreshCallback),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Visit home page to view profile
                          homePageButton(refreshCallback),
                          //Visit camera page to post sighting
                          cameraPageButton(refreshCallback),
                          //Visit isExpert application page to review/submit applications
                          isExpertApplicationPageButton(refreshCallback),
                          //visit notifications to read notifications
                        ],
                      ),
              ),
            );
          } else if (snapshot.hasError) {
            return const NoticeDialog(
                content: 'Error fetching posts. Please try again!');
          } else {
            return const LoadingScreen();
          }
        }));
  }

  Widget logoutButton() {
    return IconButton(
      icon: const Icon(Icons.logout),
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
      icon: const Icon(Icons.home, color: Color.fromARGB(255, 52, 66, 117)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget cameraPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.add_a_photo_rounded,
          color: Color.fromARGB(255, 52, 66, 117)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CameraPage(
                    currUser: widget.currUser,
                  )),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget isExpertApplicationPageButton(Function refreshCallback) {
    return IconButton(
      icon:
          const Icon(Icons.how_to_reg, color: Color.fromARGB(255, 52, 66, 117)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ExpertApplicationPage(currUser: widget.currUser)),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget waitingListPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(
        Icons.feedback,
        color: Color.fromARGB(255, 52, 66, 117),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WaitingListPage(
                    currUser: widget.currUser,
                  )),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget clickableImage(Activity activity, Function refreshCallback) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Stack(children: [
              InkWell(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActivityPage(
                            activityID: activity.activityID,
                            currUser: widget.currUser,
                          )),
                ).then((value) => refreshCallback());
              }),
            ])));
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
                Icons.verified,
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
                Icons.pending,
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
                Icons.priority_high,
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
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return activityCard(activities[index], refreshCallback);
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(12.0))
    ])));
  }

  Widget activityCard(Activity activity, Function refreshCallback) {
    return Card(
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
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: 0),
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Color.fromARGB(255, 33, 53, 88)),
                        ),
                      ]),
                  trailing: CircleAvatar(
                    radius: 8,
                    backgroundColor: activity.type == 'Workshop'
                        ? Color.fromARGB(255, 155, 91, 101)
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
                  )),
              //Post Image
              Padding(
                  padding: const EdgeInsets.only(
                      left: 12, top: 8, right: 9, bottom: 8),
                  child: Row(children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.pin_drop,
                          size: 14,
                          color: Color.fromARGB(255, 51, 64, 113),
                        )),
                    Expanded(
                      child: Text(activity.location,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 33, 53, 88))),
                    ),
                  ])),
            ]));
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
