// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Helpers/Firebase_Services/reflection_page.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/user.dart' as userModel;
import 'package:firebase_auth/firebase_auth.dart';
import '../Models/post.dart';

class ReflectionPage extends StatefulWidget {
  final String postID;
  userModel.User? currUser;
  ReflectionPage({
    Key? key,
    required this.postID,
  }) : super(key: key);
  @override
  ReflectionPageState createState() => ReflectionPageState();
}

class ReflectionPageState extends State<ReflectionPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String currUserID = '';
  bool isAdmin = false;
  List<String> currActivityList = [];
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
            FirebaseServicePost().getPost(widget.postID),
            FirebaseServicePost().getUser(currUserID)
          ]),
          builder: ((context, snapshotPost) {
            if (snapshotPost.hasData) {
              Post currPost = snapshotPost.data![0] as Post;
              widget.currUser = snapshotPost.data![1] as userModel.User;
              isAdmin = widget.currUser!.isAdmin;
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Post Details",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255))),
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                ),
                body: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        postAuthorDetails(currPost),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            currPost.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24),
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
                              currPost.description,
                            )),
                        postActions(),
                      ],
                    ))),
              );
            } else if (snapshotPost.hasError) {
              return const NoticeDialog(
                  content: 'Post not found! Please try again');
            } else {
              return const LoadingScreen();
            }
          }));
    }
  }

  Widget postAuthorDetails(Post currPost) {
    return FutureBuilder(
        future: FirebaseServicePost().getUser(currPost.userid),
        builder: ((context, snapshotUser) {
          if (snapshotUser.hasData) {
            userModel.User currUser = snapshotUser.data as userModel.User;
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(currUser.pfp),
              ),
              title: Text(currUser.name),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm a').format(currPost.date),
              ),
            );
          } else if (snapshotUser.hasError) {
            return const NoticeDialog(
                content: 'User not found! Please try again');
          } else {
            return const LoadingScreen();
          }
        }));
  }

  Widget postActions() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
      alignment: Alignment.centerLeft,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.comment),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
