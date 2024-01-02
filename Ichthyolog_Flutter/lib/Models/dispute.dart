import 'package:intl/intl.dart';

class Dispute {
  final int disputeId;
  final int authorId;
  final int commentId;
  final String authorName;
  final String dispute;
  final String authorPfp;
  final List<String>? explanatoryPic;
  final String uploadTime;
  final bool isEdited;
  final String editedTime;
  final bool isApproved;

  Dispute(
      {required this.disputeId,
      required this.authorId,
      required this.commentId,
      required this.authorName,
      required this.authorPfp,
      required this.explanatoryPic,
      required this.dispute,
      required this.uploadTime,
      required this.isEdited,
      required this.editedTime,
      required this.isApproved});

  factory Dispute.fromJson(Map<String, dynamic> json) {
    return Dispute(
        disputeId: json['disputeid'],
        commentId: json['commentid'],
        authorId: json['authorid'],
        authorName: json['username'],
        dispute: json['content'],
        authorPfp: json['pfp'],
        explanatoryPic: json['explanatorypics'],
        uploadTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['uploadtime'])),
        isEdited: json['isedited'],
        editedTime: json['editedtime'] == null
            ? 'Null'
            : DateFormat("hh:mm a, dd/MM/yyyy")
                .format(DateTime.parse(json['editedtime'])),
        isApproved: json['isapproved']);
  }
}
