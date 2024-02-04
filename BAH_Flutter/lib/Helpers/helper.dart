import 'firebase_service.dart';
import 'package:flutter/material.dart';
import '../Routes/login.dart';
import 'standard_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

final httpHelpers = FirebaseService();

class Helpers {
  Future<String> checkJwt() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jwt = pref.getString('jwt');
    if (jwt != null) {
      return jwt;
    } else {
      return '';
    }
  }

  void logout(String jwt, BuildContext context) async {
    httpHelpers.logoutRequest(jwt).then((response) async {
      if (response == 'Logged out' ||
          response == 'Logged out with expired token') {
        // storage.delete(key: 'jwt');
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove("jwt");
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const NoticeDialog(content: 'Logout failed');
            });
      }
    });
  }
}
