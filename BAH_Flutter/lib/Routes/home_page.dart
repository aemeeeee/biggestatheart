import 'package:biggestatheart/Routes/gallery_page.dart';
import 'package:biggestatheart/Routes/upload_post_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Helpers/Firebase_Services/home.dart';
import '../Helpers/Authentication/auth_service.dart';
import '../Models/activity.dart';
import 'activity_page.dart';
import 'adminReportPages/report_selection_page.dart';
import 'blog_feed_page.dart';
import 'honor_roll.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'certificate_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final firebaseService = FirebaseServiceHome();
  FirebaseAuth auth = FirebaseAuth.instance;
  String currUserID = '';
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const NoticeDialog(
          content: 'Not authorised. Please sign in again');
    } else {
      print("Current userid:${auth.currentUser!.uid}");
      return FutureBuilder(
          future: firebaseService.getUser(auth.currentUser!.uid),
          builder: ((context, snapshotUser) {
            if (snapshotUser.hasData) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  // new changes
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                  title: Row(
                    children: [
                      honorRoll(context),
                      Spacer(),
                      const Text(
                        'Home Page',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  actions: [logoutButton(context)],
                ),
                body: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/pastel.jpg'),
                                      fit: BoxFit.fill)),
                              height:
                                  MediaQuery.of(context).size.height * 1 / 2.7,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1 /
                                              18),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        1 /
                                        6,
                                    child:
                                        Image.asset('assets/images/Logo.png'),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1 /
                                              36),
                                  Wrap(children: [
                                    Text(
                                      snapshotUser.data!.username,
                                      style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),

                                    // Expert tag if user is an isExpert
                                    snapshotUser.data!.isAdmin
                                        ? Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  60,
                                                ),
                                              ),
                                            ),
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            child: const Text(
                                              'admin',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          )
                                        : const SizedBox.shrink()
                                  ]),
                                ],
                              )),
                          FutureBuilder(
                              future: firebaseService.getCurrActivities(
                                  snapshotUser.data!.currentActivities!),
                              builder: ((context, snapshotActivities) {
                                if (snapshotUser.hasData) {
                                  return galleryScreen(
                                      context,
                                      snapshotActivities.data!,
                                      refreshCallback);
                                } else {
                                  return const LoadingComment();
                                }
                              }))
                        ])),
                bottomNavigationBar: BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      uploadPostButton(refreshCallback),
                      galleryPageButton(refreshCallback),
                      blogFeedPageButton(),
                      snapshotUser.data!.isAdmin
                          ? reportPageButton()
                          : certificateRequestPageButton(refreshCallback),
                    ],
                  ),
                ),
              );
            } else if (snapshotUser.hasError) {
              print(snapshotUser.error);
              return const NoticeDialog(
                  content: 'User not found! Please try again');
            } else {
              return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: const Text('Home Page',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                  ),
                  body: const LoadingScreen());
            }
          }));
    }
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

  Widget galleryPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.photo_album),
      color: const Color.fromARGB(255, 168, 49, 85),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GalleryPage()),
        ).then((value) => refreshCallback());
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

  Widget certificateRequestPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.picture_as_pdf,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CertificatePage()),
        ).then((value) => refreshCallback());
      },
    );
  }

  refreshCallback() {
    setState(() {});
  }
}

Widget logoutButton(BuildContext context) {
  return IconButton(
      icon: const Icon(
        Icons.logout,
        color: Colors.white,
      ),
      onPressed: () {
        AuthService().logout(context);
      });
}

Widget honorRoll(BuildContext context) {
  return IconButton(
      icon: const Icon(
        FontAwesomeIcons.trophy,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HonorRollPage()),
        );
      });
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

Widget galleryScreen(
    BuildContext context, List<Activity> activities, Function refreshCallback) {
  return SingleChildScrollView(
      child: SizedBox(
          child: Column(children: [
    const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text('Your Upcoming Activities',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 33, 53, 88))),
    ),
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
          return activityCard(context, activities[index], refreshCallback);
        },
        shrinkWrap: true,
        padding: const EdgeInsets.all(12.0))
  ])));
}

Widget activityCard(
    BuildContext context, Activity activity, Function refreshCallback) {
  return InkWell(
    onTap: () {
      // Handle the tap event here, such as navigating to a new screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivityPage(
                    activityID: activity.activityID,
                  )));
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
