import 'package:biggestatheart/Routes/blog_feed_page.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/user.dart';
import 'package:intl/intl.dart';
import '../Helpers/Firebase_Services/upload_post.dart';
import '../Helpers/Firebase_Services/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Helpers/Authentication/auth_service.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});
  @override
  UploadPostPageState createState() => UploadPostPageState();
}

class UploadPostPageState extends State<UploadPostPage> {
  final firebaseService = FirebaseServiceHome();
  FirebaseAuth auth = FirebaseAuth.instance;

  String date = '';
  String title = '';
  String description = '';

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // when image is selected from gallery or taken from camera
    if (auth.currentUser == null) {
      return const NoticeDialog(
          content: 'You must be logged in to upload a post');
    } else {
      print(auth.currentUser!.uid);
      return FutureBuilder(
          future: firebaseService.getUser(auth.currentUser!.uid),
          builder: ((context, snapshotUser) {
            if (snapshotUser.hasData) {
              return Scaffold(
                appBar: AppBar(
                  leading: backButton(),
                  centerTitle: true,
                  title: const Text('Blog/Reflection/Feedback',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Title of post
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 12, right: 12),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 234, 240),
                                    borderRadius: BorderRadius.circular(16)),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 3,
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.title,
                                        color:
                                            Color.fromARGB(255, 51, 64, 113)),
                                    border: InputBorder.none,
                                    labelText: 'Title of your post',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          title = '';
                                          titleController.clear();
                                        });
                                      },
                                      icon: const Icon(Icons.clear),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      title = value;
                                    });
                                  },
                                )),

                            // Description text field
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 12, right: 12),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                height: 200,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 237, 237),
                                    borderRadius: BorderRadius.circular(16)),
                                child: TextFormField(
                                  minLines: 1,
                                  maxLines: 40,
                                  controller: descriptionController,
                                  textAlignVertical: TextAlignVertical.top,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.description,
                                        color:
                                            Color.fromARGB(255, 51, 64, 113)),
                                    border: InputBorder.none,
                                    labelText: 'Your post caption',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          description = '';
                                          descriptionController.clear();
                                        });
                                      },
                                      icon: const Icon(Icons.clear),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      description = value;
                                    });
                                  },
                                )),

                            // Upload and clear buttons
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 6, right: 12, bottom: 10),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        FirebaseServiceUploasPost().uploadPost(
                                            auth.currentUser!.uid,
                                            title,
                                            DateTime.now(),
                                            description);

                                        showDialog(
                                            context: context,
                                            builder: ((context) => AlertDialog(
                                                  title: const Text('Success!',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold)), // add styling

                                                  content: const Text(
                                                      'Your post has been uploaded'),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context); // Close the dialog
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                BlogFeedPage(), // Replace AnotherPage with the page you want to navigate to
                                                          ),
                                                        );
                                                      },
                                                      child: const Text(
                                                          'Back to Blog Feed'),
                                                    ),
                                                  ],
                                                )));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 80, 170, 121)),
                                      child: const Text('Upload',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 6, right: 12, bottom: 10),
                                    child: ElevatedButton(
                                      onPressed: () => setState(() {
                                        titleController.clear();
                                        descriptionController.clear();
                                      }),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 170, 80, 80)),
                                      child: const Text('Clear',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }));
    }
  }

  // titleCallback(newValue) {
  //   setState(() {
  //     title = newValue.split('(')[0].split(', ')[0];
  //   });
  //   final speciesRecord = singaporeRecords.singleWhere(
  //       (record) => '${record.commonNames} (${record.species})' == newValue,
  //       orElse: () {
  //     return SpeciesRecord(
  //         class_: '',
  //         order: '',
  //         family: '',
  //         genus: '',
  //         species: '',
  //         commonNames: '');
  //   });
  //   if (speciesRecord.class_ != '' &&
  //       speciesRecord.order != '' &&
  //       speciesRecord.family != '' &&
  //       speciesRecord.genus != '') {
  //     setState(() {
  //       class_ = speciesRecord.class_;
  //       order = speciesRecord.order;
  //       family = speciesRecord.family;
  //       genus = speciesRecord.genus;
  //       species = speciesRecord.species;
  //     });
  //   }
  // }

  titleClearCallback() {
    setState(() {
      title = '';
      titleController.clear();
    });
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

  Widget selectableTextForm(
      TextEditingController controller,
      String labelText,
      Icon leadingIcon,
      List<String> options,
      Function updateCallback,
      Function clearCallback) {
    return Container(
        margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
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
              onChanged: (value) => updateCallback(value),
              controller: controller,
              decoration: InputDecoration(
                focusColor: const Color.fromARGB(255, 51, 64, 113),
                icon: leadingIcon,
                border: InputBorder.none,
                labelText: labelText,
                suffixIcon: IconButton(
                  onPressed: () {
                    clearCallback();
                  },
                  icon: const Icon(Icons.clear),
                ),
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
            updateCallback(suggestion);
            controller.text = suggestion;
          },
        ));
  }
}
