import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import '../Models/user.dart';
import 'package:intl/intl.dart';
import '../Helpers/Firebase_Services/upload_post.dart';

class CameraPage extends StatefulWidget {
  final User currUser;
  const CameraPage({Key? key, required this.currUser}) : super(key: key);
  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  String date = '';
  String title = '';
  String description = '';

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // when image is selected from gallery or taken from camera

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Post a Sighting'),
        backgroundColor: const Color.fromARGB(255, 65, 90, 181),
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
                      margin:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 235, 248),
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        controller: titleController,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.description,
                              color: Color.fromARGB(255, 51, 64, 113)),
                          border: InputBorder.none,
                          labelText: 'Enter Title of your post',
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
                      margin:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 235, 248),
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 3,
                        controller: descriptionController,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.description,
                              color: Color.fromARGB(255, 51, 64, 113)),
                          border: InputBorder.none,
                          labelText: 'Enter species description',
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
                  Container(
                      margin:
                          const EdgeInsets.only(top: 6, right: 12, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseServiceUploasPost().uploadPost(
                              widget.currUser.userid,
                              title,
                              DateTime.now(),
                              description);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 80, 170, 121)),
                        child: const Text('Upload',
                            style: TextStyle(fontSize: 17)),
                      )),
                  Container(
                      margin:
                          const EdgeInsets.only(top: 6, right: 12, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                          titleController.clear();
                          descriptionController.clear();
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 170, 80, 80)),
                        child:
                            const Text('Clear', style: TextStyle(fontSize: 17)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
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
