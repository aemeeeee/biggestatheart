import 'package:intl/intl.dart';

class Comment {
  final int commentId;
  final int authorId;
  final int postId;
  final String authorName;
  final String comment;
  final String authorPfp;
  final String uploadTime;
  final int upvotes;
  final bool isEdited;
  final String editedTime;
  final bool hasExpertAuthor;
  final bool isIdSuggestion;
  final bool isApprovedSuggestion;
  final bool isRejectedSuggestion;
  final bool hasReplacedId;
  final bool isDisputed;
  final String idRejectionReason;

  Comment(
      {required this.commentId,
      required this.authorId,
      required this.postId,
      required this.authorName,
      required this.authorPfp,
      required this.comment,
      required this.uploadTime,
      required this.upvotes,
      required this.isEdited,
      required this.editedTime,
      required this.hasExpertAuthor,
      required this.isIdSuggestion,
      required this.isApprovedSuggestion,
      required this.isRejectedSuggestion,
      required this.hasReplacedId,
      required this.isDisputed,
      required this.idRejectionReason});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        commentId: json['commentid'],
        authorId: json['authorid'],
        postId: json['postid'],
        authorName: json['username'],
        comment: json['comment'],
        authorPfp: json['pfp'],
        uploadTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['uploadtime'])),
        upvotes: json['upvotes'],
        isEdited: json['isedited'],
        editedTime: json['editedtime'] == null
            ? 'Null'
            : DateFormat("hh:mm a, dd/MM/yyyy")
                .format(DateTime.parse(json['editedtime'])),
        hasExpertAuthor: json['isexpert'],
        isIdSuggestion: json['isidsuggestion'],
        isApprovedSuggestion: json['isapprovedsuggestion'],
        isRejectedSuggestion: json['isrejectedsuggestion'],
        hasReplacedId: json['hasreplacedid'],
        isDisputed: json['isdisputed'],
        idRejectionReason: json['idrejectionreason'] ?? 'Null');
  }
}
