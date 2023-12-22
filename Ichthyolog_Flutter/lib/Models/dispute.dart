import 'package:intl/intl.dart';

class Dispute {
  final int disputeId;
  final int authorId;
  final int commentId;
  final String authorName;
  final String content;
  final String authorPic;
  final String? explanatoryPic;
  final String postedTime;
  final bool edited;
  final String editedTime;
  final bool disputeApproved;

  Dispute(
      {required this.disputeId,
      required this.authorId,
      required this.commentId,
      required this.authorName,
      required this.authorPic,
      required this.explanatoryPic,
      required this.content,
      required this.postedTime,
      required this.edited,
      required this.editedTime,
      required this.disputeApproved});

  factory Dispute.fromJson(Map<String, dynamic> json) {
    return Dispute(
        disputeId: json['disputeid'],
        commentId: json['commentid'],
        authorId: json['authorid'],
        authorName: json['authorname'],
        content: json['content'],
        authorPic: json['authorpicurl'],
        explanatoryPic: json['explanatorypic'],
        postedTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['postedtime'])),
        edited: json['edited'],
        editedTime: json['editedtime'] == null
            ? 'Null'
            : DateFormat("hh:mm a, dd/MM/yyyy")
                .format(DateTime.parse(json['editedtime'])),
        disputeApproved: json['disputeapproved']);
  }
}
