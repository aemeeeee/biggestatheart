import 'package:intl/intl.dart';

class CommentNotification {
  final int notificationId;
  final String receipient;
  final String content;
  final String sender;
  final String senderPfp;
  final int senderId;
  final int postId;
  final List<String> postPics;
  final String creationTime;
  final bool hasViewed;

  CommentNotification(
      {required this.notificationId,
      required this.receipient,
      required this.content,
      required this.sender,
      required this.senderPfp,
      required this.senderId,
      required this.postId,
      required this.postPics,
      required this.creationTime,
      required this.hasViewed});

  factory CommentNotification.fromJson(Map<String, dynamic> json) {
    return CommentNotification(
        notificationId: json['notificationid'],
        receipient: json['receipient'],
        content: json['content'],
        sender: json['sender'],
        senderPfp: json['pfp'],
        senderId: json['userid'],
        postId: json['postid'],
        postPics: json['sightingimages'],
        creationTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['creationtime'])),
        hasViewed: json['hasviewed']);
  }
}
