import 'package:flutter/material.dart';
import '../Helpers/helper.dart';
import '../Helpers/Firebase_Services/signup.dart';
import '../Helpers/custom_icons.dart';
import '../Models/post.dart';
import '../Models/user.dart';
import '../Models/species.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'post_page.dart';
import 'home_page.dart';
import 'gallery_page.dart';
import 'statistics_page.dart';
import 'expert_application_page.dart';
import 'camera_page.dart';
import 'notifications_page.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import 'stepper.dart';

class WaitingListPage extends StatefulWidget {
  final User currUser;
  const WaitingListPage({super.key, required this.currUser});
  @override
  WaitingListPageState createState() => WaitingListPageState();
}

class WaitingListPageState extends State<WaitingListPage> {
  String jwt = '';
  Map<String, dynamic> decodedJWT = {};
  String newTitle = '';
  String newDescription = '';
  final httpHelpers = HttpHelpers();
  final helpers = Helpers();
  bool flagPostRequestProcessing = false;
  bool unflagPostRequestProcessing = false;
  bool editPostRequestProcessing = false;
  bool deletePostRequestProcessing = false;
  bool verifyPostRequestProcessing = false;

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
          decodedJWT = JwtDecoder.decode(token);
        });
      }
    });
  }

  flagPostRequestProcessingCallback() {
    setState(() {
      flagPostRequestProcessing = !flagPostRequestProcessing;
    });
  }

  unflagPostRequestProcessingCallback() {
    setState(() {
      unflagPostRequestProcessing = !unflagPostRequestProcessing;
    });
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

  verifyPostRequestProcessingCallback() {
    setState(() {
      verifyPostRequestProcessing = !verifyPostRequestProcessing;
    });
  }

  refreshCallback() {
    print("POPPPP");
    setState(() {});
  }

  Widget galleryScreen(BuildContext context, List<Post> posts) {
    return SingleChildScrollView(
        child: SizedBox(
            child: Column(children: [
      galleryLegend(),
      GridView.builder(
          itemCount: posts.length,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 7.0,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return postCard(posts[index]);
          },
          shrinkWrap: true,
          padding: const EdgeInsets.all(12.0))
    ])));
  }

  Widget postCard(Post post) {
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: post.species == null
                          ? [
                              Text(
                                post.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Color.fromARGB(255, 33, 53, 88)),
                              ),
                            ]
                          : [
                              Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    post.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        color: Color.fromARGB(255, 33, 53, 88)),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    post.species!,
                                    style: const TextStyle(
                                        fontSize: 8,
                                        color: Color.fromARGB(255, 33, 53, 88)),
                                  )),
                            ]),
                  trailing: CircleAvatar(
                    radius: 8,
                    backgroundColor: post.flagged
                        ? const Color.fromARGB(255, 152, 72, 85)
                        : const Color.fromARGB(255, 175, 103, 51),
                    child: Icon(
                      post.flagged ? Icons.priority_high : Icons.pending,
                      size: 10,
                      color: Colors.white,
                    ),
                  )),
              clickableImage(post),
              expertActions(post)
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpHelpers.viewAllUnverifiedPostsRequest(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Pending ID Waiting List'),
                backgroundColor: const Color.fromARGB(255, 65, 90, 181),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      helpers.logout(jwt, context);
                    },
                  ),
                ],
              ),
              body: galleryScreen(context, snapshot.data!),
            );
          } else if (snapshot.hasError) {
            if (snapshot.error == 'Posts Not Found') {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Pending ID Waiting List'),
                  backgroundColor: const Color.fromARGB(255, 65, 90, 181),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        helpers.logout(jwt, context);
                      },
                    ),
                  ],
                ),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(),
                      const Text(
                        'Waiting list is empty!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 70, 88, 152),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ]),
                bottomNavigationBar: BottomAppBar(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        homePageButton(refreshCallback),
                        cameraPageButton(refreshCallback),
                        galleryPageButton(widget.currUser, refreshCallback),
                        statsPageButton(refreshCallback),
                        expertApplicationPageButton(
                            widget.currUser, refreshCallback),
                        notificationsPageButton(widget.currUser)
                      ]),
                ),
              );
            } else {
              return NoticeDialog(content: 'Error: ${snapshot.error}');
            }
          } else {
            return const LoadingScreen();
          }
        }));
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
              radius: 8,
              backgroundColor: Color.fromARGB(255, 175, 103, 51),
              child: Icon(
                Icons.pending,
                size: 10,
                color: Colors.white,
              )),
          SizedBox(width: 4),
          Text(
            "[ Pending Verification ]",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color.fromARGB(255, 175, 103, 51)),
          ),
          SizedBox(width: 14),
          CircleAvatar(
              radius: 8,
              backgroundColor: Color.fromARGB(255, 152, 72, 85),
              child: Icon(
                Icons.priority_high,
                size: 10,
                color: Colors.white,
              )),
          SizedBox(width: 4),
          Text(
            "[ Flagged ]",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color.fromARGB(255, 152, 72, 85)),
          ),
        ]));
  }

  Widget clickableImage(Post post) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, bottom: 6),
        child: InkWell(
            child: Ink.image(
                image: NetworkImage(post.sightingPics.first),
                fit: BoxFit.cover),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostPage(
                          postid: post.postid,
                          currUser: widget.currUser,
                          acceptIdCallback: refreshCallback,
                        )),
              );
            }),
      ),
    );
  }

  Widget expertActions(Post post) {
    return Padding(
        padding: const EdgeInsets.only(right: 7, bottom: 8, top: 3),
        child: Wrap(spacing: 4, alignment: WrapAlignment.end, children: [
          flagPostButton(post),
          editPostButton(post),
          verifyPostButton(post),
          deletePostButton(post)
        ]));
  }

  Widget flagPostButton(Post post) {
    return ElevatedButton(
      onPressed: () {
        if (post.flagged) {
          if (unflagPostRequestProcessing) {
            null;
          } else {
            unflagPostRequestProcessingCallback();
            httpHelpers.unFlagPostRequest(post.postid, jwt).then((response) {
              unflagPostRequestProcessingCallback();
              if (response == 'Post Unflagged') {
                setState(() {});
                Fluttertoast.showToast(
                  msg: 'Post Unflagged',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                );
              } else {
                Fluttertoast.showToast(
                  msg: 'Post Unflagging Failed',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                );
              }
            });
          }
        } else {
          if (flagPostRequestProcessing) {
            null;
          } else {
            flagPostRequestProcessingCallback();
            httpHelpers.flagPostRequest(post.postid, jwt).then((response) {
              flagPostRequestProcessingCallback();
              if (response == 'Post Flagged') {
                setState(() {});
                Fluttertoast.showToast(
                  msg: 'Post Flagged',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                );
              } else {
                Fluttertoast.showToast(
                  msg: 'Post Flagging Failed',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                );
              }
            });
          }
        }
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
          minimumSize: Size.zero,
          backgroundColor: const Color.fromARGB(255, 199, 96, 139),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      child: post.flagged
          ? const Text('Unflag', style: TextStyle(fontSize: 9))
          : const Text('Flag', style: TextStyle(fontSize: 9)),
    );
  }

  Widget editPostButton(Post post) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              String newTitle = '';
              String newClass = '';
              String newOrder = '';
              String newFamily = '';
              String newGenus = '';
              String newSpecies = '';
              String newLocation = '';
              final TextEditingController titleController =
                  TextEditingController();
              final TextEditingController locationController =
                  TextEditingController();
              List<String> allSpecies = <String>[];
              for (var record in singaporeRecords) {
                allSpecies.add('${record.commonNames} (${record.species})');
              }
              return StatefulBuilder(builder: (context, setState) {
                classCallback(newValue) {
                  setState(() {
                    newClass = newValue;
                  });
                }

                orderCallback(newValue) {
                  setState(() {
                    newOrder = newValue;
                  });
                }

                familyCallback(newValue) {
                  setState(() {
                    newFamily = newValue;
                  });
                }

                genusCallback(newValue) {
                  setState(() {
                    newGenus = newValue;
                  });
                }

                titleCallback(newValue) {
                  setState(() {
                    newTitle = newValue.split('(')[0].split(', ')[0];
                  });
                  final speciesRecord = singaporeRecords.singleWhere(
                      (record) =>
                          '${record.commonNames} (${record.species})' ==
                          newValue, orElse: () {
                    return SpeciesRecord(
                        class_: '',
                        order: '',
                        family: '',
                        genus: '',
                        species: '',
                        commonNames: '');
                  });
                  if (speciesRecord.class_ != '' &&
                      speciesRecord.order != '' &&
                      speciesRecord.family != '' &&
                      speciesRecord.genus != '') {
                    setState(() {
                      newClass = speciesRecord.class_;
                      newOrder = speciesRecord.order;
                      newFamily = speciesRecord.family;
                      newGenus = speciesRecord.genus;
                      newSpecies = speciesRecord.species;
                    });
                  }
                }

                locationCallback(newValue) {
                  setState(() {
                    newLocation = newValue;
                  });
                }

                return AlertDialog(
                  title: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Edit Post"),
                  ),
                  content: SingleChildScrollView(
                      child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Edit Species Name',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 51, 64, 113)),
                        )),
                    selectableTextForm(
                        titleController, post.title, allSpecies, titleCallback),
                    Container(
                        margin: const EdgeInsets.only(top: 10, left: 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Edit Description',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 51, 64, 113)),
                        )),
                    Container(
                        margin:
                            const EdgeInsets.only(top: 8, left: 5, right: 5),
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 225, 235, 248),
                            borderRadius: BorderRadius.circular(16)),
                        child: TextFormField(
                          initialValue: post.description,
                          minLines: 1,
                          maxLines: null,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Edit Description'),
                          onChanged: (value) {
                            setState(() {
                              newDescription = value;
                            });
                          },
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 5, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Edit Location',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 51, 64, 113)),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: selectableTextForm(
                            locationController,
                            post.sightingLocation,
                            locations,
                            locationCallback)),
                    Wrap(
                      children: [
                        const Text(
                          'Class: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 51, 64, 113),
                              fontSize: 13),
                        ),
                        Text(
                          newClass == '' ? '${post.class_}   ' : '$newClass   ',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Text(
                          'Order: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 51, 64, 113),
                              fontSize: 13),
                        ),
                        Text(
                          newOrder == '' ? '${post.order}' : newOrder,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Wrap(
                          children: [
                            const Text(
                              'Family: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 51, 64, 113),
                                  fontSize: 13),
                            ),
                            Text(
                              newFamily == ''
                                  ? '${post.family}   '
                                  : '$newFamily   ',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Text(
                              'Genus: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 51, 64, 113),
                                  fontSize: 13),
                            ),
                            Text(
                              newGenus == '' ? '${post.genus}' : newGenus,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        )),
                  ])),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 7),
                        child: Wrap(spacing: 5, children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(content: StatefulBuilder(
                                      builder: (context, setState) {
                                        return SpeciesStepper(
                                          classCallback: classCallback,
                                          orderCallback: orderCallback,
                                          familyCallback: familyCallback,
                                          genusCallback: genusCallback,
                                        );
                                      },
                                    ));
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                backgroundColor:
                                    const Color.fromARGB(255, 102, 154, 217)),
                            child: const Text(
                              'Edit Classification',
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(8),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor:
                                      const Color.fromARGB(255, 80, 170, 121)),
                              child: const Text(
                                "Confirm",
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                if (editPostRequestProcessing) {
                                  null;
                                } else {
                                  editPostRequestProcessingCallback();
                                  httpHelpers
                                      .editPostInfoRequest(
                                          post.postid,
                                          jwt,
                                          newTitle,
                                          newDescription,
                                          newLocation,
                                          newClass,
                                          newOrder,
                                          newFamily,
                                          newGenus,
                                          newSpecies)
                                      .then((response) {
                                    editPostRequestProcessingCallback();
                                    Fluttertoast.showToast(
                                      msg: response,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                    );
                                    if (response == 'Post Edited') {
                                      Navigator.pop(context);
                                      setState(() {
                                        newClass = '';
                                        newOrder = '';
                                        newFamily = '';
                                        newGenus = '';
                                      });
                                    }
                                  });
                                }
                              }),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(8),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  backgroundColor:
                                      const Color.fromARGB(255, 170, 80, 80)),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  newClass = '';
                                  newOrder = '';
                                  newFamily = '';
                                  newGenus = '';
                                });
                              })
                        ])),
                  ],
                );
              });
            }).then((value) {
          setState(() {});
        });
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
          minimumSize: Size.zero,
          backgroundColor: const Color.fromARGB(255, 93, 123, 200),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      child: const Text('Edit', style: TextStyle(fontSize: 9)),
    );
  }

  Widget verifyPostButton(Post post) {
    return ElevatedButton(
      onPressed: () {
        if (verifyPostRequestProcessing) {
          null;
        } else {
          verifyPostRequestProcessingCallback();
          httpHelpers.verifyPostRequest(post.postid, jwt).then((response) {
            verifyPostRequestProcessingCallback();
            if (response == 'Post Verified') {
              setState(() {});
              Fluttertoast.showToast(
                msg: 'Post Verified',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            } else {
              Fluttertoast.showToast(
                msg: 'Post Verification Failed',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
              );
            }
          });
        }
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
          minimumSize: Size.zero,
          backgroundColor: const Color.fromARGB(255, 63, 142, 97),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      child: const Text('Verify', style: TextStyle(fontSize: 9)),
    );
  }

  Widget deletePostButton(Post post) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: const Text("Warning"),
                  content:
                      const Text('Are you sure? This action is irreversible!'),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 80, 170, 121)),
                        child: const Text("Yes"),
                        onPressed: () {
                          if (deletePostRequestProcessing) {
                            null;
                          } else {
                            deletePostRequestProcessingCallback();
                            httpHelpers
                                .deletePostRequest(post.postid, jwt)
                                .then(
                              (response) {
                                deletePostRequestProcessingCallback();
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                  msg: response,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                );
                                setState(() {});
                              },
                            );
                          }
                        }),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 170, 80, 80)),
                        child: const Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
          minimumSize: Size.zero,
          backgroundColor: const Color.fromARGB(255, 194, 93, 93),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      child: const Text('Delete', style: TextStyle(fontSize: 9)),
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

  Widget expertApplicationPageButton(User user, Function refreshCallback) {
    return IconButton(
      icon:
          const Icon(Icons.how_to_reg, color: Color.fromARGB(255, 52, 66, 117)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExpertApplicationPage(currUser: user)),
        ).then((value) => refreshCallback());
      },
    );
  }

  Widget notificationsPageButton(User user) {
    return FutureBuilder(
        future: httpHelpers.countUnviewedNotificationsRequest(jwt),
        builder: ((context, snapshotNotif) {
          return Stack(children: [
            IconButton(
              icon: const Icon(Icons.notification_important,
                  color: Color.fromARGB(255, 52, 66, 117)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsPage(currUser: user)),
                ).then((value) => refreshCallback());
              },
            ),
            snapshotNotif.hasData && snapshotNotif.data! > 0 ||
                    snapshotNotif.hasError
                ? Positioned(
                    top: 3,
                    right: 6,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                60,
                              ),
                            ),
                            color: const Color.fromARGB(255, 167, 71, 71),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 4),
                                color: Colors.black.withOpacity(
                                  0.1,
                                ),
                                blurRadius: 3,
                              ),
                            ]),
                        child: snapshotNotif.hasData
                            ? Text('${snapshotNotif.data!}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))
                            : const Icon(Icons.error)))
                : const SizedBox.shrink()
          ]);
        }));
  }

  Widget selectableTextForm(TextEditingController controller, String hintText,
      List<String> options, Function callback) {
    return Container(
        margin: const EdgeInsets.only(top: 8, left: 5, right: 5),
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 225, 235, 248),
            borderRadius: BorderRadius.circular(16)),
        child: TypeAheadFormField(
          hideOnLoading: true,
          hideOnEmpty: true,
          textFieldConfiguration: TextFieldConfiguration(
              onChanged: (value) => callback(value),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                focusColor: const Color.fromARGB(255, 51, 64, 113),
                border: InputBorder.none,
              ),
              autofocus: true,
              style: const TextStyle(color: Color.fromARGB(255, 51, 64, 113))),
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          errorBuilder: (context, error) {
            return NoticeDialog(content: '$error');
          },
          suggestionsCallback: (pattern) {
            List<String> matches = [];
            if (pattern == '') {
              return matches;
            } else {
              matches.addAll(options);
              matches.retainWhere((matches) {
                return matches.toLowerCase().contains(pattern.toLowerCase());
              });
              return matches;
            }
          },
          onSuggestionSelected: (suggestion) {
            callback(suggestion);
            controller.text = suggestion;
          },
        ));
  }
}
