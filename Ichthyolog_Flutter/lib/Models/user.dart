//This folder stores classes that represent the major objects used
//These classes will be used to store the data returned from backend

//User class for user profile and authentication
class User {
  final int userid;
  final String username;
  final String password;
  final String email;
  final String pfp;
  final int level;
  final int postCount;
  final int speciesCount;
  final bool isExpert;
  final List<int> upvotedComments;
  final List<int> downvotedComments;

//use of required keyword as none of these fields can be null
  User(
      {required this.userid,
      required this.username,
      required this.password,
      required this.email,
      required this.pfp,
      required this.level,
      required this.speciesCount,
      required this.postCount,
      required this.isExpert,
      required this.upvotedComments,
      required this.downvotedComments});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userid: json['userid'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        pfp: json['pfp'],
        level: json['level'],
        speciesCount: json['speciescount'],
        postCount: json['postcount'],
        isExpert: json['isexpert'],
        upvotedComments: json['upvotedcomments'],
        downvotedComments: json['downvotedcomments']);
  }
}
