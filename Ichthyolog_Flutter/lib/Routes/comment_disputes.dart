import 'package:flutter/material.dart';
import 'dart:io';
import '../Models/user.dart';
import '../Models/comment.dart';
import '../Models/dispute.dart';
import '../Helpers/http.dart';
import '../Helpers/helper.dart';
import '../Helpers/standard_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class CommentDisputes extends StatefulWidget {
  final User currUser;
  final Comment comment;
  final int postid;
  final String jwt;
  final Function updateCallback;
  const CommentDisputes(
      {super.key,
      required this.currUser,
      required this.comment,
      required this.postid,
      required this.jwt,
      required this.updateCallback});
  @override
  CommentDisputesState createState() => CommentDisputesState();
}

class CommentDisputesState extends State<CommentDisputes> {
  final httpHelpers = HttpHelpers();
  final helpers = Helpers();
  bool expanded = false;
  String updatedContent = '';
  File? image;
  TextEditingController disputeController = TextEditingController();
  bool addDisputeRequestProcessing = false;
  bool editDisputeRequestProcessing = false;
  bool deleteDisputeRequestProcessing = false;
  bool approveDisputeRequestProcessing = false;
  bool uploadPicRequestProcessing = false;

  updateContentCallback(String value) {
    setState(() {
      updatedContent = value;
    });
    widget.updateCallback();
  }

  retrieveCallback() {
    return updatedContent;
  }

  addDisputeRequestProcessingCallback() {
    setState(() {
      addDisputeRequestProcessing = !addDisputeRequestProcessing;
    });
  }

  editDisputeRequestProcessingCallback() {
    setState(() {
      editDisputeRequestProcessing = !editDisputeRequestProcessing;
    });
  }

  deleteDisputeRequestProcessingCallback() {
    setState(() {
      deleteDisputeRequestProcessing = !deleteDisputeRequestProcessing;
    });
  }

  approveDisputeRequestProcessingCallback() {
    setState(() {
      approveDisputeRequestProcessing = !approveDisputeRequestProcessing;
    });
  }

  uploadPicRequestProcessingCallback() {
    setState(() {
      uploadPicRequestProcessing = !uploadPicRequestProcessing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpHelpers.viewDisputesRequest(widget.comment.commentId),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: EdgeInsets.only(
                    left: 64, right: 18, bottom: expanded ? 10 : 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Toggles the 'expanded' state to show/hide the disputes.
                      Padding(
                          padding: EdgeInsets.only(left: expanded ? 8 : 14),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                expanded ? expanded = false : expanded = true;
                              });
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(2),
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            child: Text(
                              expanded ? 'Minimise' : 'View disputes',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 51, 64, 113),
                                  fontSize: 12),
                            ),
                          )),

                      // Displays the disputes.
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: expanded ? snapshot.data!.length : 0,
                          itemBuilder: (BuildContext context, int index) {
                            return snapshot.data![index].authorId ==
                                    widget.currUser.userid
                                ? ownDispute(
                                    snapshot.data![index],
                                    widget.jwt,
                                    updateContentCallback,
                                    widget.updateCallback,
                                    retrieveCallback,
                                    editDisputeRequestProcessingCallback,
                                    deleteDisputeRequestProcessingCallback,
                                    approveDisputeRequestProcessingCallback,
                                    editDisputeRequestProcessing,
                                    deleteDisputeRequestProcessing,
                                    approveDisputeRequestProcessing,
                                    context,
                                    widget.currUser,
                                    widget.comment,
                                    widget.postid,
                                  )
                                : otherDispute(
                                    snapshot.data![index],
                                    widget.updateCallback,
                                    widget.jwt,
                                    context,
                                    widget.currUser,
                                    widget.comment,
                                    widget.postid,
                                    approveDisputeRequestProcessingCallback,
                                    approveDisputeRequestProcessing);
                          }),

                      // Displays the 'Add a dispute' section.
                      !expanded
                          ? const SizedBox.shrink()
                          // If the comment is idReplaced, the 'Add a dispute' section is hidden, otherwise it is displayed.
                          : widget.comment.idReplaced
                              ? const Padding(
                                  padding: EdgeInsets.only(
                                      left: 18, top: 6, bottom: 8),
                                  child: Text(
                                    'A dispute is accepted, this thread has been locked',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 51, 64, 113),
                                        fontSize: 12),
                                  ))
                              : widget.currUser.expert
                                  ? Row(children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              7 /
                                              11,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1 /
                                              25,
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          child: TextField(
                                            style:
                                                const TextStyle(fontSize: 13),
                                            controller: disputeController,
                                            decoration: InputDecoration(
                                              hintText: 'Add a dispute',
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 5),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  disputeController.clear();
                                                },
                                                icon: const Icon(Icons.clear,
                                                    size: 16),
                                              ),
                                            ),
                                          )),
                                      // IconButton(
                                      //     constraints: const BoxConstraints(),
                                      //     icon: const CircleAvatar(
                                      //         radius: 10,
                                      //         backgroundColor: Colors.white,
                                      //         child: Icon(
                                      //           Icons.camera_alt_rounded,
                                      //           size: 18,
                                      //           color: Color.fromARGB(
                                      //               255, 89, 98, 181),
                                      //         )),
                                      //     onPressed: () {}),
                                      ElevatedButton(
                                          onPressed: () {
                                            if (addDisputeRequestProcessing) {
                                              null;
                                            } else {
                                              addDisputeRequestProcessingCallback();
                                              httpHelpers
                                                  .addDisputeRequest(
                                                      widget.comment.commentId,
                                                      disputeController.text,
                                                      widget.jwt)
                                                  .then(
                                                (response) {
                                                  addDisputeRequestProcessingCallback();
                                                  Fluttertoast.showToast(
                                                    msg: response,
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                  );
                                                  if (response ==
                                                      'Dispute added successfully!') {
                                                    widget.updateCallback();
                                                    disputeController.clear();
                                                  }
                                                },
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(6),
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 80, 170, 121)),
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(fontSize: 11),
                                          )),
                                    ])
                                  : const SizedBox.shrink()
                    ]));
          } else if (snapshot.hasError) {
            if (snapshot.error == 'Disputes not found') {
              return const SizedBox.shrink();
            } else {
              return NoticeDialog(content: '${snapshot.error}');
            }
          } else {
            return loadingComment();
          }
        }));
  }

  void uploadPic(String jwt) async {
    final key = const Uuid().v4();
    final file = AWSFile.fromPath(image!.path);
    if (uploadPicRequestProcessing) {
      null;
    } else {
      try {
        Amplify.Storage.uploadFile(
          key: key,
          localFile: file,
          options: const StorageUploadFileOptions(
            accessLevel: StorageAccessLevel.guest,
          ),
        );
      } catch (error) {
        Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
        );
      }
    }
  }

  Future<void> _takePhoto(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  Future<void> _selectFromGallery() async {
    _takePhoto(ImageSource.gallery);
  }
}

Widget ownDispute(
    Dispute dispute,
    String jwt,
    Function editCallback,
    Function updateCallback,
    Function retrieveCallback,
    Function editDisputeRequestProcessingCallback,
    Function deleteDisputeRequestProcessingCallback,
    Function approveDisputeRequestProcessingCallback,
    bool editDisputeRequestProcessing,
    bool deleteDisputeRequestProcessing,
    bool approveDisputeRequestProcessing,
    BuildContext context,
    User currUser,
    Comment comment,
    int postid) {
  return ListTile(
      horizontalTitleGap: 0,
      leading: CircleAvatar(
          radius: 14, backgroundImage: NetworkImage(dispute.authorPic)),
      title: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Displays the 'Expert' tag if the author is an expert.
                  const Padding(
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        'Expert',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 51, 64, 113)),
                      )),

                  // Displays the author's name.
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        dispute.authorName,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 51, 64, 113)),
                      )),

                  // Displays the 'dispute approved' tag if the dispute is approved.
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: dispute.disputeApproved
                          ? const Text(
                              '’s dispute is accepted',
                              style: TextStyle(fontSize: 11),
                            )
                          : const Text(
                              ' issued a dispute: ',
                              style: TextStyle(fontSize: 11),
                            )),
                ],
              ),

              // Displays the explanatory picture if there is one.
              dispute.explanatoryPic == null
                  ? const SizedBox.shrink()
                  : Image(
                      image: NetworkImage(dispute.explanatoryPic!),
                      fit: BoxFit.cover),
              Container(
                  padding: const EdgeInsets.all(2),
                  color: dispute.disputeApproved
                      ? const Color.fromARGB(255, 231, 250, 237)
                      : null,
                  child: Text(
                    dispute.content,
                    style: const TextStyle(fontSize: 13),
                  ))
            ],
          )),

      // Displays the 'Edit', 'Delete' and 'Accept Dispute' buttons if the current user is an expert or the author of the comment.
      subtitle: comment.idReplaced
          ? null
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(3),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text("Edit Dispute"),
                                    content: TextFormField(
                                      initialValue: dispute.content,
                                      minLines: 1,
                                      maxLines: 10,
                                      decoration: const InputDecoration(
                                        hintText: "Edit Dispute",
                                      ),
                                      onChanged: (value) {
                                        editCallback(value);
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 80, 170, 121)),
                                          child: const Text("Confirm"),
                                          onPressed: () {
                                            if (editDisputeRequestProcessing) {
                                              null;
                                            } else {
                                              editDisputeRequestProcessingCallback();
                                              httpHelpers
                                                  .editDisputeRequest(
                                                      dispute.disputeId,
                                                      retrieveCallback(),
                                                      jwt)
                                                  .then((response) {
                                                editDisputeRequestProcessingCallback();
                                                Fluttertoast.showToast(
                                                  msg: response,
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                );
                                                if (response ==
                                                    'Dispute Edited') {
                                                  Navigator.pop(context);
                                                  updateCallback('Refreshed');
                                                }
                                              });
                                            }
                                          }),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 170, 80, 80)),
                                          child: const Text("Cancel"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ]);
                              });
                        },
                        child: const Text('Edit',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 68, 95, 143)))),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(3),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text("Warning"),
                                    content: const Text(
                                        'Are you sure? This action is irreversible!'),
                                    actions: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 80, 170, 121)),
                                          child: const Text("Yes"),
                                          onPressed: () {
                                            if (deleteDisputeRequestProcessing) {
                                              null;
                                            } else {
                                              deleteDisputeRequestProcessingCallback();
                                              httpHelpers
                                                  .deleteDisputeRequest(
                                                      comment.commentId,
                                                      dispute.disputeId,
                                                      jwt)
                                                  .then(
                                                (response) {
                                                  deleteDisputeRequestProcessingCallback();
                                                  Fluttertoast.showToast(
                                                    msg: response,
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                  );
                                                  Navigator.pop(context);
                                                  if (response ==
                                                      'Dispute Deleted') {
                                                    updateCallback('Refreshed');
                                                  }
                                                },
                                              );
                                            }
                                          }),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 170, 80, 80)),
                                          child: const Text("Cancel"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          })
                                    ]);
                              });
                        },
                        child: const Text('Delete',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 68, 95, 143)))),
                    ((currUser.expert && currUser.userid != dispute.authorId) ||
                                currUser.userid == comment.authorId) &&
                            comment.disputed
                        ? TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(3),
                                minimumSize: Size.zero,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: const Text("Warning"),
                                        content: const Text(
                                            'Are you sure? This action is irreversible!'),
                                        actions: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 80, 170, 121)),
                                              child: const Text("Yes"),
                                              onPressed: () {
                                                if (approveDisputeRequestProcessing) {
                                                  null;
                                                } else {
                                                  approveDisputeRequestProcessingCallback();
                                                  httpHelpers
                                                      .approveDisputeRequest(
                                                          comment.commentId,
                                                          dispute.disputeId,
                                                          postid,
                                                          jwt)
                                                      .then(
                                                    (response) {
                                                      approveDisputeRequestProcessingCallback();
                                                      Fluttertoast.showToast(
                                                        msg: response,
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 1,
                                                      );
                                                      Navigator.pop(context);
                                                      if (response ==
                                                          'Dispute approved successfully') {
                                                        updateCallback(
                                                            'Refreshed');
                                                      }
                                                    },
                                                  );
                                                }
                                              }),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 170, 80, 80)),
                                              child: const Text("Cancel"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              })
                                        ]);
                                  });
                            },
                            child: const Text('Accept Dispute',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 68, 95, 143))))
                        : const SizedBox.shrink()
                  ]))
            ]));
}

Widget otherDispute(
    Dispute dispute,
    Function updateCallback,
    String jwt,
    BuildContext context,
    User currUser,
    Comment comment,
    int postid,
    Function approveDisputeRequestProcessingCallback,
    bool approveDisputeRequestProcessing) {
  return ListTile(
      horizontalTitleGap: 0,
      leading: CircleAvatar(
          radius: 14, backgroundImage: NetworkImage(dispute.authorPic)),
      title: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Displays the 'Expert' tag if the author is an expert.
                  const Padding(
                      padding: EdgeInsets.only(right: 4, bottom: 2),
                      child: Text(
                        'Expert',
                        style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 51, 64, 113)),
                      )),

                  // Displays the author's name.
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        dispute.authorName,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 51, 64, 113)),
                      )),

                  // Displays the 'dispute approved' tag if the dispute is approved.
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: dispute.disputeApproved
                          ? const Text(
                              '’s dispute is accepted',
                              style: TextStyle(fontSize: 11),
                            )
                          : const Text(
                              ' issued a dispute: ',
                              style: TextStyle(fontSize: 11),
                            )),
                ],
              ),

              // Displays the explanatory picture if there is one.
              dispute.explanatoryPic == null
                  ? const SizedBox.shrink()
                  : Image(
                      image: NetworkImage(dispute.explanatoryPic!),
                      fit: BoxFit.cover),
              Container(
                  padding: const EdgeInsets.all(2),
                  color: dispute.disputeApproved
                      ? const Color.fromARGB(255, 231, 250, 237)
                      : null,
                  child: Text(
                    dispute.content,
                    style: const TextStyle(fontSize: 13),
                  ))
            ],
          )),

      // Displays the 'Accept Dispute' button if the current user is an expert or the author of the comment.
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          dispute.edited
              ? 'Edited at ${dispute.editedTime}'
              : 'Posted at ${dispute.postedTime}',
          style: const TextStyle(fontSize: 11),
        ),
        ((currUser.expert && currUser.userid != dispute.authorId) ||
                    currUser.userid == comment.authorId) &&
                comment.disputed
            ? TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(3),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text("Warning"),
                            content: const Text(
                                'Are you sure? This action is irreversible!'),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 80, 170, 121)),
                                  child: const Text("Yes"),
                                  onPressed: () {
                                    if (approveDisputeRequestProcessing) {
                                      null;
                                    } else {
                                      approveDisputeRequestProcessingCallback();
                                      httpHelpers
                                          .approveDisputeRequest(
                                              comment.commentId,
                                              dispute.disputeId,
                                              postid,
                                              jwt)
                                          .then(
                                        (response) {
                                          approveDisputeRequestProcessingCallback();
                                          Fluttertoast.showToast(
                                            msg: response,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                          );
                                          Navigator.pop(context);
                                          if (response ==
                                              'Dispute approved successfully') {
                                            updateCallback('Refreshed');
                                          }
                                        },
                                      );
                                    }
                                  }),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 170, 80, 80)),
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })
                            ]);
                      });
                },
                child: const Text('Accept Dispute',
                    style: TextStyle(
                        fontSize: 10, color: Color.fromARGB(255, 68, 95, 143))))
            : const SizedBox.shrink()
      ]));
}
