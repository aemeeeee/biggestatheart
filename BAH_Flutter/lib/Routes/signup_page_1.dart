import 'package:flutter/material.dart';
import '../Routes/login.dart';
import 'login_background.dart';
import 'signup_page_2.dart';
import '../Helpers/Firebase_Services/signup.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({super.key});
  @override
  SignUpPage1State createState() => SignUpPage1State();
}

class SignUpPage1State extends State<SignUpPage1> {
  String _userName = '';
  String _userEmail = '';
  String _password = '';
  String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  final firebaseServiceSignup = FirebaseServiceSignup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const LoginBackgroundPage(),
        ListView(children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //arrow back button to login page
                  backButton(),
                  //Logo up top
                  logo(),
                  //App Title
                  appTitle(),
                  //Username field
                  usernameField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Email field
                  emailField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Password field
                  passwordField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Confirm password field
                  confirmPasswordField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 22),
                  //Next page button
                  nextButton(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 22),
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }

  bool isValidUsername(String username) {
    if (username.isEmpty || username.length > 25) {
      return false;
    }
    return true;
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^[\w-]+(.[\w-]+)@[a-zA-Z0-9-]+(.[a-zA-Z0-9-]+)(.[a-zA-Z]{2,})$')
        .hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Check if the password meets the criteria
    bool hasCapitalLetter = false;
    bool hasSpecialCharacter = false;

    for (int i = 0; i < password.length; i++) {
      var char = password[i];
      if (char == char.toUpperCase()) {
        hasCapitalLetter = true;
      }
      if (char.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacter = true;
      }
    }

    return hasCapitalLetter && hasSpecialCharacter;
  }

  Widget nextButton() {
    return SizedBox(
        width: 250,
        height: 36,
        child: ElevatedButton(
          onPressed: () {
            final bool? isValid = _formKey.currentState?.validate();
            if (isValid == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpPage2(
                          userName: _userName,
                          userEmail: _userEmail,
                          password: _password,
                        )),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      "Notice",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                      'Please make sure you have entered your account details correctly.',
                      style: TextStyle(fontSize: 18),
                    ),
                    actions: [
                      TextButton(
                          child:
                              const Text("OK", style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  );
                },
              );
            }
          },
          child: const Text('Next'),
        ));
  }

  Widget appTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        'BiggestAtHeart',
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a username';
          } else if (value.trim().length > 25) {
            return 'Username must be less than 25 characters';
          } else {
            return null;
          }
        },
        onChanged: (value) => _userName = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter a username',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter an email';
          } else if (!isValidEmail(value)) {
            return 'Please enter a valid email';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          _userEmail = value;
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your email',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        obscureText: true,
        onChanged: (value) {
          _password = value;
        },
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter a password';
          } else if (value.length < 6 || value.length > 20) {
            return 'Password must be 6-20 characters';
          } else if (!isValidPassword(value)) {
            return 'Require at least 1 capital letter and 1 special character';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your password',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget confirmPasswordField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please confirm your password';
          } else if (value != _password) {
            return 'Passwords do not match';
          } else {
            return null;
          }
        },
        onChanged: (value) => _confirmPassword = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Confirm your password',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      width: 170,
      height: 170,
      margin: const EdgeInsets.only(top: 10),
      child: Image.asset('assets/images/Logo.png'),
    );
  }

  Widget backButton() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 20),
      child: IconButton(
          color: const Color.fromARGB(255, 57, 81, 189),
          iconSize: 35,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              )),
    );
  }
}
