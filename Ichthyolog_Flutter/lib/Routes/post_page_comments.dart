import 'package:flutter/material.dart';
import '../Models/comment.dart';
import '../Helpers/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'comments_page.dart';
import 'comments.dart';
import 'comment_disputes.dart';
import '../Models/species.dart';
import '../Models/user.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Helpers/standard_widgets.dart';

class PostPageMultiComment extends StatefulWidget {
  final List<Comment> comments;
  final httpHelpers = HttpHelpers();
  final String jwt;
  final int postid;
  final String postPicture;
  final User currUser;
  final Map<String, dynamic> decodedJWT;
  final Function updateCallBack;

  PostPageMultiComment(
      {Key? key,
      required this.comments,
      required this.jwt,
      required this.postid,
      required this.postPicture,
      required this.currUser,
      required this.decodedJWT,
      required this.updateCallBack})
      : super(key: key);

  @override
  PostPageMultiCommentState createState() => PostPageMultiCommentState();
}

class PostPageMultiCommentState extends State<PostPageMultiComment> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // if the first comment is by the current user, show the comment as an OwnComment
      // else, show the comment as an OtherComment
      widget.jwt == ''
          ? Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: OtherComment(
                comment: widget.comments[widget.comments.length - 1],
                jwt: widget.jwt,
                updateCallBack: widget.updateCallBack,
                userid: widget.decodedJWT['userid'] ?? -1,
                postid: widget.postid,
                currUser: widget.currUser,
              ))
          : widget.comments[widget.comments.length - 1].authorId ==
                  widget.decodedJWT['userid']
              ? OwnComment(
                  comment: widget.comments[0],
                  jwt: widget.jwt,
                  updateCallBack: widget.updateCallBack,
                  userid: widget.decodedJWT['userid'],
                  postid: widget.postid,
                  currUser: widget.currUser,
                )
              : OtherComment(
                  comment: widget.comments[0],
                  jwt: widget.jwt,
                  updateCallBack: widget.updateCallBack,
                  userid: widget.decodedJWT['userid'],
                  postid: widget.postid,
                  currUser: widget.currUser,
                ),

      // if there are more than 2 comments, click to expand and show the rest of the comments
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CommentPage(
                      postid: widget.postid,
                      postPic: widget.postPicture,
                      currUser: widget.currUser,
                      acceptIdCallback: widget.updateCallBack,
                    )),
          ).then((value) => widget.updateCallBack('Refreshed'));
        },
        child: Text(
          'View ${widget.comments.length - 1} other replies',
          style: const TextStyle(color: Color.fromARGB(255, 51, 64, 113)),
        ),
      ),
    ]);
  }
}

class PostPageSingleComment extends StatefulWidget {
  final List<Comment> comments;
  final String jwt;
  final int postid;
  final String postPic;
  final User currUser;
  final Map<String, dynamic> decodedJWT;
  final Function updateCallBack;

  const PostPageSingleComment(
      {Key? key,
      required this.comments,
      required this.jwt,
      required this.postid,
      required this.postPic,
      required this.decodedJWT,
      required this.updateCallBack,
      required this.currUser})
      : super(key: key);

  @override
  PostPageSingleCommentState createState() => PostPageSingleCommentState();
}

class PostPageSingleCommentState extends State<PostPageSingleComment> {
  final contentText = TextEditingController();
  final httpHelpers = HttpHelpers();
  String content = '';
  bool suggestingID = false;
  bool textfieldclicked = false;
  List<String> allSpecies = <String>[];
  FocusNode focusNode = FocusNode();
  bool addIdRequestProcessing = false;
  bool addCommentRequestProcessing = false;
  bool addNotificationRequestProcessing = false;
  bool showUsernames = false;
  List<String> usernames = [];
  String taggedUser = '';
  int currIndex = 0;
  final RegExp terminatingExpressions =
      RegExp(r'\B[@\<\>\(\)\{\}+=-_\[\]\s,:;?!]');
  final RegExp taggedUserExpression = RegExp(r'\B@\w+');

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree
    contentText.dispose();
    focusNode.removeListener(onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.jwt != '') {
      for (var record in singaporeRecords) {
        allSpecies.add('${record.commonNames} (${record.species})');
      }
    }
    httpHelpers.viewAllUsernamesRequest(widget.jwt).then((response) {
      usernames = response;
    });
    focusNode.addListener(onFocusChange);
  }

  onFocusChange() {
    setState(() {
      textfieldclicked = !textfieldclicked;
    });
  }

  clearCallback() {
    setState(() {
      contentText.clear();
    });
  }

  updateCallback(String value) {
    setState(() {
      content = value;
    });
  }

  addIdRequestProcessingCallback() {
    setState(() {
      addIdRequestProcessing = !addIdRequestProcessing;
    });
  }

  addCommentRequestProcessingCallback() {
    setState(() {
      addCommentRequestProcessing = !addCommentRequestProcessing;
    });
  }

  addNotificationRequestProcessingCallback() {
    setState(() {
      addNotificationRequestProcessing = !addNotificationRequestProcessing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.jwt == ''
        ? Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: OtherComment(
              comment: widget.comments[widget.comments.length - 1],
              jwt: widget.jwt,
              updateCallBack: widget.updateCallBack,
              userid: widget.decodedJWT['userid'] ?? -1,
              postid: widget.postid,
              currUser: widget.currUser,
            ))
        : Column(children: [
            widget.comments[widget.comments.length - 1].authorId ==
                    widget.decodedJWT['userid']
                ? OwnComment(
                    comment: widget.comments[widget.comments.length - 1],
                    jwt: widget.jwt,
                    updateCallBack: widget.updateCallBack,
                    userid: widget.decodedJWT['userid'],
                    postid: widget.postid,
                    currUser: widget.currUser,
                  )
                : OtherComment(
                    comment: widget.comments[widget.comments.length - 1],
                    jwt: widget.jwt,
                    updateCallBack: widget.updateCallBack,
                    userid: widget.decodedJWT['userid'],
                    postid: widget.postid,
                    currUser: widget.currUser,
                  ),
            widget.comments[widget.comments.length - 1].idSuggestion &&
                    (widget.comments[widget.comments.length - 1].disputed ||
                        widget.comments[widget.comments.length - 1].idReplaced)
                ? CommentDisputes(
                    currUser: widget.currUser,
                    comment: widget.comments[widget.comments.length - 1],
                    postid: widget.postid,
                    jwt: widget.jwt,
                    updateCallback: widget.updateCallBack)
                : widget.comments[widget.comments.length - 1].idSuggestion &&
                        widget.comments[widget.comments.length - 1]
                            .suggestionRejected
                    ? Padding(
                        padding: const EdgeInsets.only(left: 76, bottom: 15),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Reason for rejection: ${widget.comments[widget.comments.length - 1].idRejectionReason}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 152, 72, 85),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500))))
                    : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: suggestingID
                  ? selectableTextForm(contentText, 'Suggest an ID', allSpecies,
                      clearCallback, updateCallback, focusNode)
                  : TextFormField(
                      focusNode: focusNode,
                      controller: contentText,
                      decoration: InputDecoration(
                        hintText: 'Reply',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              contentText.clear();
                            });
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          contentText.text = value;
                        });
                      },
                      onChanged: (value) {
                        if (contentText.text.characters
                                .elementAt(contentText.selection.end - 1) ==
                            '@') {
                          setState(() {
                            showUsernames = true;
                            currIndex = contentText.selection.end - 1;
                          });
                        }
                        if (showUsernames) {
                          String userSubstring = value.substring(currIndex);
                          setState(() {
                            taggedUser = userSubstring
                                        .split('@')[1]
                                        .split(terminatingExpressions) ==
                                    []
                                ? userSubstring.split('@')[1].trim()
                                : userSubstring
                                    .split('@')[1]
                                    .split(terminatingExpressions)[0]
                                    .trim();
                          });
                        }
                      },
                    ),
            ),
            showUsernames
                ? ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: usernames.map((user) {
                      if (user.contains(taggedUser) && taggedUser != '') {
                        return ListTile(
                          title: Text(
                            user,
                          ),
                          onTap: () {
                            setState(() {
                              showUsernames = false;
                              String beforeTag = contentText.text
                                  .substring(0, currIndex)
                                  .trim();
                              String afterTag = contentText.text
                                  .substring(currIndex + taggedUser.length + 1)
                                  .trim();
                              contentText.text = beforeTag == ''
                                  ? '@$user $afterTag'
                                  : afterTag == ''
                                      ? '$beforeTag @$user'
                                      : '$beforeTag @$user $afterTag';
                              contentText.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: contentText.text.length));
                              taggedUser = '';
                            });
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }).toList())
                : const SizedBox.shrink(),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  top: 6,
                  left: 20,
                  right: 20,
                  bottom: textfieldclicked ? 80 : 10),
              child: Wrap(spacing: 10, children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      suggestingID = !suggestingID;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: suggestingID
                          ? const Color.fromARGB(255, 79, 142, 112)
                          : const Color.fromARGB(255, 170, 99, 117)),
                  child: suggestingID
                      ? const Text('ID Suggestion Mode: On',
                          style: TextStyle(fontSize: 15))
                      : const Text('ID Suggestion Mode: Off',
                          style: TextStyle(fontSize: 15)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (suggestingID) {
                      if (addIdRequestProcessing) {
                        null;
                      } else {
                        addIdRequestProcessingCallback();
                        httpHelpers
                            .addIdSuggestionRequest(
                                widget.postid, contentText.text, widget.jwt)
                            .then((response) {
                          addIdRequestProcessingCallback();
                          Fluttertoast.showToast(
                            msg: response,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                          );
                          if (response ==
                              'ID suggestion posted successfully!') {
                            widget.updateCallBack(response);
                            setState(() {
                              contentText.clear();
                            });
                          }
                        });
                      }
                    } else {
                      if (addCommentRequestProcessing) {
                        null;
                      } else {
                        if (contentText.text == '') {
                          Fluttertoast.showToast(
                            msg: 'Cannot post empty comment!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                          );
                        } else {
                          addCommentRequestProcessingCallback();
                          httpHelpers
                              .addCommentRequest(
                                  widget.postid,
                                  contentText.text,
                                  widget.currUser.expert,
                                  widget.jwt)
                              .then((response) {
                            addCommentRequestProcessingCallback();
                            if (response == 'Comment Posted') {
                              if (addNotificationRequestProcessing) {
                                null;
                              } else {
                                List<String> taggedUsers = taggedUserExpression
                                    .allMatches(contentText.text)
                                    .map((match) => match.group(0)!)
                                    .toList();

                                for (var everyUser in taggedUsers) {
                                  addNotificationRequestProcessingCallback();
                                  httpHelpers
                                      .createNotificationRequest(
                                          everyUser.substring(1),
                                          contentText.text,
                                          widget.currUser.profilepic,
                                          widget.postPic,
                                          widget.postid,
                                          widget.jwt)
                                      .then((response) {
                                    addNotificationRequestProcessingCallback();
                                    setState(() {
                                      taggedUsers.clear();
                                      taggedUser = '';
                                      showUsernames = false;
                                    });
                                  });
                                }
                              }
                              widget.updateCallBack(response);
                              Fluttertoast.showToast(
                                msg: 'Comment posted successfully!',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                              );
                              setState(() {
                                contentText.clear();
                              });
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Comment failed to post :(',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                              );
                            }
                          });
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 86, 148)),
                  child: const Text('Post', style: TextStyle(fontSize: 15)),
                )
              ]),
            )
          ]);
  }
}

class PostPageNoComment extends StatefulWidget {
  final String jwt;
  final int postid;
  final String postPic;
  final User currUser;
  final Function addCallBack;

  const PostPageNoComment(
      {Key? key,
      required this.jwt,
      required this.postid,
      required this.postPic,
      required this.currUser,
      required this.addCallBack})
      : super(key: key);

  @override
  PostPageNoCommentState createState() => PostPageNoCommentState();
}

class PostPageNoCommentState extends State<PostPageNoComment> {
  final contentText = TextEditingController();
  final httpHelpers = HttpHelpers();
  String content = '';
  bool suggestingID = false;
  bool textfieldclicked = false;
  List<String> allSpecies = <String>[];
  FocusNode focusNode = FocusNode();
  bool addIdRequestProcessing = false;
  bool addCommentRequestProcessing = false;
  bool addNotificationRequestProcessing = false;
  bool showUsernames = false;
  List<String> usernames = [];
  String taggedUser = '';
  int currIndex = 0;
  final RegExp terminatingExpressions =
      RegExp(r'\B[@\<\>\(\)\{\}+=-_\[\]\s,:;?!]');
  final RegExp taggedUserExpression = RegExp(r'\B@\w+');

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree
    contentText.dispose();
    focusNode.removeListener(onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.jwt != '') {
      setState(() {
        for (var record in singaporeRecords) {
          allSpecies.add('${record.commonNames} (${record.species})');
        }
      });
    }
    httpHelpers.viewAllUsernamesRequest(widget.jwt).then((response) {
      usernames = response;
    });
    focusNode.addListener(onFocusChange);
  }

  clearCallback() {
    setState(() {
      contentText.clear();
    });
  }

  updateCallback(String value) {
    setState(() {
      content = value;
    });
  }

  onFocusChange() {
    setState(() {
      textfieldclicked = !textfieldclicked;
    });
  }

  addIdRequestProcessingCallback() {
    setState(() {
      addIdRequestProcessing = !addIdRequestProcessing;
    });
  }

  addCommentRequestProcessingCallback() {
    setState(() {
      addCommentRequestProcessing = !addCommentRequestProcessing;
    });
  }

  addNotificationRequestProcessingCallback() {
    setState(() {
      addNotificationRequestProcessing = !addNotificationRequestProcessing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.jwt == ''
        ? Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            child: const Text('No comments yet'))
        : Column(children: [
            Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                alignment: Alignment.centerLeft,
                child: const Text('No comments yet')),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: suggestingID
                  ? selectableTextForm(contentText, 'Suggest an ID', allSpecies,
                      clearCallback, updateCallback, focusNode)
                  : TextFormField(
                      focusNode: focusNode,
                      controller: contentText,
                      decoration: InputDecoration(
                        hintText: 'Reply',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              contentText.clear();
                            });
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          contentText.text = value;
                        });
                      },
                      onChanged: (value) {
                        if (contentText.text.characters
                                .elementAt(contentText.selection.end - 1) ==
                            '@') {
                          setState(() {
                            showUsernames = true;
                            currIndex = contentText.selection.end - 1;
                          });
                        }
                        if (showUsernames) {
                          String userSubstring = value.substring(currIndex);
                          setState(() {
                            taggedUser = userSubstring
                                        .split('@')[1]
                                        .split(terminatingExpressions) ==
                                    []
                                ? userSubstring.split('@')[1].trim()
                                : userSubstring
                                    .split('@')[1]
                                    .split(terminatingExpressions)[0]
                                    .trim();
                          });
                        }
                      },
                    ),
            ),
            showUsernames
                ? ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: usernames.map((user) {
                      if (user.contains(taggedUser) && taggedUser != '') {
                        return ListTile(
                          title: Text(
                            user,
                          ),
                          onTap: () {
                            setState(() {
                              showUsernames = false;
                              String beforeTag = contentText.text
                                  .substring(0, currIndex)
                                  .trim();
                              String afterTag = contentText.text
                                  .substring(currIndex + taggedUser.length + 1)
                                  .trim();
                              contentText.text = beforeTag == ''
                                  ? '@$user $afterTag'
                                  : afterTag == ''
                                      ? '$beforeTag @$user'
                                      : '$beforeTag @$user $afterTag';
                              contentText.selection =
                                  TextSelection.fromPosition(TextPosition(
                                      offset: contentText.text.length));
                              taggedUser = '';
                            });
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }).toList())
                : const SizedBox.shrink(),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  top: 6,
                  left: 20,
                  right: 20,
                  bottom: textfieldclicked ? 80 : 10),
              child: Wrap(spacing: 10, children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      suggestingID = !suggestingID;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: suggestingID
                          ? const Color.fromARGB(255, 79, 142, 112)
                          : const Color.fromARGB(255, 170, 99, 117)),
                  child: suggestingID
                      ? const Text('ID Suggestion Mode: On',
                          style: TextStyle(fontSize: 15))
                      : const Text('ID Suggestion Mode: Off',
                          style: TextStyle(fontSize: 15)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (suggestingID) {
                      if (addIdRequestProcessing) {
                        null;
                      } else {
                        addIdRequestProcessingCallback();
                        httpHelpers
                            .addIdSuggestionRequest(
                                widget.postid, contentText.text, widget.jwt)
                            .then((response) {
                          addIdRequestProcessingCallback();
                          Fluttertoast.showToast(
                            msg: response,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                          );
                          if (response ==
                              'ID suggestion posted successfully!') {
                            widget.addCallBack(response);
                            setState(() {
                              contentText.clear();
                            });
                          }
                        });
                      }
                    } else {
                      if (addCommentRequestProcessing) {
                        null;
                      } else {
                        if (contentText.text == '') {
                          Fluttertoast.showToast(
                            msg: 'Cannot post empty comment!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                          );
                        } else {
                          addCommentRequestProcessingCallback();
                          httpHelpers
                              .addCommentRequest(
                                  widget.postid,
                                  contentText.text,
                                  widget.currUser.expert,
                                  widget.jwt)
                              .then((response) {
                            addCommentRequestProcessingCallback();
                            if (response == 'Comment Posted') {
                              if (addNotificationRequestProcessing) {
                                null;
                              } else {
                                List<String> taggedUsers = taggedUserExpression
                                    .allMatches(contentText.text)
                                    .map((match) => match.group(0)!)
                                    .toList();

                                for (var everyUser in taggedUsers) {
                                  addNotificationRequestProcessingCallback();
                                  httpHelpers
                                      .createNotificationRequest(
                                          everyUser.substring(1),
                                          contentText.text,
                                          widget.currUser.profilepic,
                                          widget.postPic,
                                          widget.postid,
                                          widget.jwt)
                                      .then((response) {
                                    addNotificationRequestProcessingCallback();
                                    setState(() {
                                      taggedUsers.clear();
                                      taggedUser = '';
                                      showUsernames = false;
                                    });
                                  });
                                }
                              }
                              widget.addCallBack(response);
                              Fluttertoast.showToast(
                                msg: 'Comment posted successfully!',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                              );
                              setState(() {
                                contentText.clear();
                              });
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Comment failed to post :(',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                              );
                            }
                          });
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 68, 86, 148)),
                  child: const Text('Post', style: TextStyle(fontSize: 15)),
                )
              ]),
            ),
          ]);
  }
}

Widget selectableTextForm(
    TextEditingController controller,
    String hintText,
    List<String> options,
    Function clearCallback,
    Function updateCallback,
    FocusNode focusNode) {
  return TypeAheadFormField(
    hideOnLoading: true,
    hideOnEmpty: true,
    textFieldConfiguration: TextFieldConfiguration(
        focusNode: focusNode,
        onChanged: (value) => updateCallback(value),
        controller: controller,
        decoration: InputDecoration(
          focusColor: const Color.fromARGB(255, 51, 64, 113),
          hintText: hintText,
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
      controller.text = suggestion;
    },
  );
}
