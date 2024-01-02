import 'package:flutter/material.dart';
import 'comments_page.dart';
import '../Helpers/standard_widgets.dart';
import '../Helpers/helper.dart';
import '../Helpers/http.dart';
import '../Models/user.dart';
import '../Models/notifications.dart';
import 'camera_page.dart';
import 'home_page.dart';
import 'gallery_page.dart';
import 'statistics_page.dart';
import 'expert_application_page.dart';
import 'waiting_list_page.dart';
import '../Helpers/custom_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationsPage extends StatefulWidget {
  final User currUser;

  const NotificationsPage({
    Key? key,
    required this.currUser,
  }) : super(key: key);
  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  String jwt = '';
  final helpers = Helpers();
  final httpHelpers = HttpHelpers();

  @override
  void initState() {
    super.initState();
    helpers.checkJwt().then((token) {
      if (token == '') {
        setState(() {
          jwt = '';
        });
      } else {
        setState(() {
          jwt = token;
        });
      }
    });
  }

  refreshCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Notifications'),
          backgroundColor: const Color.fromARGB(255, 65, 90, 181)),
      body: FutureBuilder(
          future: httpHelpers.viewNotificationsRequest(jwt),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    padding: const EdgeInsets.only(top: 6),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 8.2 / 10,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return commentNotification(snapshot.data![index]);
                        }))
              ]));
            } else if (snapshot.hasError &&
                snapshot.error == 'Notifications not found') {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No notifications currently!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 70, 88, 152),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )
                      ]));
            } else {
              print(snapshot.error);
              return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [LoadingScreen()]);
            }
          })),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.currUser.isExpert
              ? [
                  homePageButton(refreshCallback),
                  cameraPageButton(refreshCallback),
                  galleryPageButton(widget.currUser, refreshCallback),
                  statsPageButton(refreshCallback),
                  isExpertApplicationPageButton(refreshCallback),
                  waitingListPageButton(refreshCallback)
                ]
              : [
                  homePageButton(refreshCallback),
                  cameraPageButton(refreshCallback),
                  galleryPageButton(widget.currUser, refreshCallback),
                  isExpertApplicationPageButton(refreshCallback),
                  statsPageButton(refreshCallback),
                ],
        ),
      ),
    );
  }

  Widget commentNotification(CommentNotification notification) {
    return GestureDetector(
        onTap: () {
          httpHelpers
              .openNotificationRequest(notification.notificationId, jwt)
              .then((response) {
            if (response == 'Notification opened successfully!') {
              refreshCallback();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommentPage(
                          postid: notification.postId,
                          postPic: notification.postPicture,
                          currUser: widget.currUser,
                          acceptIdCallback: refreshCallback,
                        )),
              ).then((value) => refreshCallback());
            } else {
              Fluttertoast.showToast(
                msg: response,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            }
          });
        },
        child: ListTile(
          horizontalTitleGap: 10,
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          leading: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(notification.senderProfilePic)),
          title: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            notification.senderUsername,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 51, 64, 113)),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Text(
                            ' tagged you in a comment',
                            style: TextStyle(fontSize: 13),
                          )),
                    ],
                  ),
                  Container(
                      color: notification.viewed
                          ? Colors.white
                          : const Color.fromARGB(255, 255, 240, 240),
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            notification.notificationContent,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 51, 64, 113)),
                          ))),
                ],
              )),
          subtitle: Text(
            'at ${notification.createdTime}',
            style: const TextStyle(fontSize: 11),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: SizedBox(
              height: 60.0,
              width: 60.0,
              child: Image.network(notification.postPicture),
            ),
          ),
        ));
  }

  Widget logoutButton() {
    return IconButton(
      icon: const Icon(Icons.logout),
      onPressed: () {
        helpers.logout(jwt, context);
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

  Widget galleryPageButton(User user, Function refreshCallback) {
    return IconButton(
      icon: const Icon(CustomIcons.sightingsIcon,
          color: Color.fromARGB(255, 52, 66, 117)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GalleryPage(currUser: user)),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget statsPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.search, color: Color.fromARGB(255, 52, 66, 117)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StatisticsPage()),
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
}
