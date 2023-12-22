import 'package:intl/intl.dart';

class CommentNotification {
  final int notificationId;
  final String receiverUsername;
  final String notificationContent;
  final String senderUsername;
  final String senderProfilePic;
  final int senderId;
  final int postId;
  final String postPicture;
  final String createdTime;
  final bool viewed;

  CommentNotification(
      {required this.notificationId,
      required this.receiverUsername,
      required this.notificationContent,
      required this.senderUsername,
      required this.senderProfilePic,
      required this.senderId,
      required this.postId,
      required this.postPicture,
      required this.createdTime,
      required this.viewed});

  factory CommentNotification.fromJson(Map<String, dynamic> json) {
    return CommentNotification(
        notificationId: json['notificationid'],
        receiverUsername: json['receiverusername'],
        notificationContent: json['notificationcontent'],
        senderUsername: json['senderusername'],
        senderProfilePic: json['senderprofilepic'],
        senderId: json['senderid'],
        postId: json['postid'],
        postPicture: json['postpicture'],
        createdTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['time'])),
        viewed: json['viewed']);
  }
}
