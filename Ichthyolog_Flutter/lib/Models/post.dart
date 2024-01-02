//This file stores classes that represent the major objects used
//These classes will be used to store the data returned from backend
import 'package:intl/intl.dart';

//Post class for user posts
class Post {
  final int postid;
  final int userid;
  final String authorname;
  final String title;
  final String description;
  final List<String> sightingPics;
  final String uploadTime;
  final String sightingTime;
  final String sightingLocation;
  final String? sightingCoordinates;
  final String authorPfp;
  final String? class_;
  final String? order;
  final String? family;
  final String? genus;
  final String? species;
  final bool verified;
  final bool flagged;
  final String? verifier;

//use of required keyword as none of these fields can be null
  Post(
      {required this.postid,
      required this.userid,
      required this.authorname,
      required this.title,
      required this.description,
      required this.sightingPics,
      required this.uploadTime,
      required this.sightingTime,
      required this.sightingLocation,
      this.sightingCoordinates,
      required this.authorPfp,
      this.class_,
      this.order,
      this.family,
      this.genus,
      this.species,
      required this.verified,
      required this.flagged,
      this.verifier});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postid: json['postid'],
      userid: json['userid'],
      authorname: json['username'],
      title: json['title'],
      description: json['description'] ?? 'Not specified',
      sightingPics: json['sightingimages'],
      uploadTime: DateFormat("hh:mm a, dd/MM/yyyy")
          .format(DateTime.parse(json['time'])),
      sightingLocation: json['sightinglocation'] ?? 'Not specified',
      sightingCoordinates: json['sightinglocation'] ?? 'Not specified',
      sightingTime: DateFormat("hh:mm a, dd/MM/yyyy")
          .format(DateTime.parse(json['sightingtime'])),
      authorPfp: json['pfp'],
      class_: json['class'],
      order: json['_order'],
      family: json['family'],
      genus: json['genus'],
      species: json['species'],
      verified: json['verified'],
      flagged: json['flagged'],
      verifier: json['verifier'],
    );
  }
}
