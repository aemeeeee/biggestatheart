// ignore_for_file: must_be_immutable
import 'package:biggestatheart/Routes/gallery_page.dart';
import 'package:biggestatheart/Routes/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/post.dart';
import '../Models/user.dart' as user;
import 'reflection_page.dart';
import 'upload_post_page.dart';
import 'home_page.dart';
import '../Helpers/Firebase_Services/blog_feed_page.dart';
import 'package:intl/intl.dart';

class BlogFeedPage extends StatefulWidget {
  user.User? currUser;
  BlogFeedPage({super.key});
  @override
  BlogFeedPageState createState() => BlogFeedPageState();
}

class BlogFeedPageState extends State<BlogFeedPage> {
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
            FirebaseServiceBlog().getAllPosts(),
            FirebaseServiceBlog().getUser(currUserID)
          ]),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data![0] as List<Post>;
              widget.currUser = snapshot.data![1] as user.User;
              isAdmin = widget.currUser!.isAdmin;
              return Scaffold(
                appBar: AppBar(
                  leading: backButton(),
                  centerTitle: true,
                  title: const Text('Blog Feed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                  actions: [
                    addNewPostButton(refreshCallback),
                  ],
                ),
                body: galleryScreen(context, posts, refreshCallback),
                bottomNavigationBar: BottomAppBar(
                  child: isAdmin
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Visit home page to view profile
                            homePageButton(refreshCallback),
                            //Visit camera page to post sighting
                            uploadPostButton(refreshCallback),
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
                            galleryPageButton(),
                            blogFeedPageButton(),
                            //Visit isExpert application page to review/submit applications
                            isExpertApplicationPageButton(refreshCallback),
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

  Widget blogFeedPageButton() {
    return IconButton(
      icon: const Icon(Icons.article, color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        refreshCallback();
      },
    );
  }

  Widget addNewPostButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UploadPostPage()),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GalleryPage()),
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

  Widget isExpertApplicationPageButton(Function refreshCallback) {
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

  Widget waitingListPageButton(Function refreshCallback) {
    return IconButton(
      icon: const Icon(
        Icons.feedback,
        color: Color.fromARGB(255, 52, 66, 117),
      ),
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => WaitingListPage(
        //             currUser: widget.currUser,
        //           )),
        // ).then((value) => refreshCallback());
      },
    );
  }

  Widget cardTitle(Post post) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Stack(
          children: [
            Text(
              post.title.length > 60
                  ? 'Title: ${post.title.substring(0, 60)}...'
                  : 'Title: ${post.title}',
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

  Widget galleryScreen(
      BuildContext context, List<Post> posts, Function refreshCallback) {
    return SingleChildScrollView(
        child: SizedBox(
            child: Column(children: [
      GridView.builder(
          itemCount: posts.length,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 7.0,
            childAspectRatio: 3,
          ),
          itemBuilder: (context, index) {
            return postCard(posts[index], refreshCallback);
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(12.0))
    ])));
  }

  Widget postCard(Post post, Function refreshCallback) {
    return FutureBuilder(
      future: FirebaseServiceBlog().getUser(post.userid),
      builder: (context, snapshot) {
        user.User author = snapshot.data as user.User;
        return InkWell(
          onTap: () {
            // Handle the tap event here, such as navigating to a new screen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReflectionPage(postID: post.postid)),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Post Image
                ListTile(
                  title: Text(
                    author.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 33, 53, 88),
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(author.pfp),
                    radius: 15,
                  ),
                ),
                cardTitle(post),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 15),
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(post.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 33, 53, 88),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
