import 'package:intl/intl.dart';

class Comment {
  final int commentId;
  final int authorId;
  final int postId;
  final String authorName;
  final String content;
  final String authorPic;
  final String postedTime;
  final int upvotes;
  final bool edited;
  final String editedTime;
  final bool authorExpert;
  final bool idSuggestion;
  final bool suggestionApproved;
  final bool suggestionRejected;
  final bool idReplaced;
  final bool disputed;
  final String idRejectionReason;

  Comment(
      {required this.commentId,
      required this.authorId,
      required this.postId,
      required this.authorName,
      required this.authorPic,
      required this.content,
      required this.postedTime,
      required this.upvotes,
      required this.edited,
      required this.editedTime,
      required this.authorExpert,
      required this.idSuggestion,
      required this.suggestionApproved,
      required this.suggestionRejected,
      required this.idReplaced,
      required this.disputed,
      required this.idRejectionReason});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        commentId: json['commentid'],
        authorId: json['authorid'],
        postId: json['postid'],
        authorName: json['authorname'],
        content: json['content'],
        authorPic: json['authorpic'],
        postedTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['postedtime'])),
        upvotes: json['upvotes'],
        edited: json['edited'],
        editedTime: json['editedtime'] == null
            ? 'Null'
            : DateFormat("hh:mm a, dd/MM/yyyy")
                .format(DateTime.parse(json['editedtime'])),
        authorExpert: json['authorexpert'],
        idSuggestion: json['idsuggestion'],
        suggestionApproved: json['suggestionapproved'],
        suggestionRejected: json['suggestionrejected'],
        idReplaced: json['idreplaced'],
        disputed: json['disputed'],
        idRejectionReason: json['idrejectionreason'] ?? 'Null');
  }
}
