//This folder stores classes that represent the major objects used
//These classes will be used to store the data returned from backend

//User class for user profile and authentication
class User {
  final int userid;
  final String username;
  final String password;
  final String email;
  final String profilepic;
  final int level;
  final int totalposts;
  final int speciescount;
  final bool expert;

//use of required keyword as none of these fields can be null
  User(
      {required this.userid,
      required this.username,
      required this.password,
      required this.email,
      required this.profilepic,
      required this.level,
      required this.speciescount,
      required this.totalposts,
      required this.expert});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userid: json['userid'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        profilepic: json['profilepic'],
        level: json['level'],
        speciescount: json['speciescount'],
        totalposts: json['totalposts'],
        expert: json['expert']);
  }
}
