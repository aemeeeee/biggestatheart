import 'package:intl/intl.dart';

class ExpertApplicationRequest {
  final int applicationId;
  final int authorId;
  final String authorName;
  final int age;
  final String gender;
  final String occupation;
  final String email;
  final int contact;
  final String credentials;
  final String postedTime;
  final String approved;
  final String rejectionReason;

  ExpertApplicationRequest(
      {required this.applicationId,
      required this.authorId,
      required this.authorName,
      required this.age,
      required this.gender,
      required this.occupation,
      required this.email,
      required this.contact,
      required this.credentials,
      required this.postedTime,
      required this.approved,
      required this.rejectionReason});

  factory ExpertApplicationRequest.fromJson(Map<String, dynamic> json) {
    return ExpertApplicationRequest(
        applicationId: json['applicationid'],
        authorId: json['authorid'],
        authorName: json['authorname'],
        age: json['age'],
        gender: json['gender'],
        occupation: json['occupation'],
        email: json['email'],
        contact: json['contact'],
        credentials: json['credentials'],
        postedTime: DateFormat("hh:mm a, dd/MM/yyyy")
            .format(DateTime.parse(json['postedtime'])),
        approved: json['approved'] == null
            ? 'not processed'
            : json['approved'] == true
                ? 'true'
                : 'false',
        rejectionReason: json['rejectionreason'] ?? 'Null');
  }
}
