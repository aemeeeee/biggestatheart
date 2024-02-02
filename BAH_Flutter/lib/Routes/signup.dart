import 'package:flutter/material.dart';
import 'package:ichthyolog/Routes/home_page.dart';
import 'package:ichthyolog/Routes/login.dart';
import 'login_background.dart';
import '../Helpers/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Helpers/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  String _userName = '';
  String _userEmail = '';
  String _password = '';
  String _name = '';
  int _age = 0;
  String _ethnicity = '';
  String _gender = '';
  String _education = '';
  String _occupation = '';
  String _interets = '';
  String _skills = '';
  String _preferences = '';
  String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  final httpHelpers = HttpHelpers();
  bool singupRequestProcessing = false;

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
                  //Project name
                  projectName(),
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
                  //Sign up button
                  signUpButton()
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

  signupProcessingCallback() {
    setState(() {
      singupRequestProcessing = !singupRequestProcessing;
    });
    print("CHNAGED");
  }

  void addUser() {
    var db = FirebaseFirestore.instance;
    db.collection('users').add({
      'email': _userEmail,
      'username': _userName,
      'name': _name,
      'age': _age,
      'ethnicity': _ethnicity,
      'gender': _gender,
      'education': _education,
      'occupation': _occupation,
      'interests': _interets,
      'skills': _skills,
      'preferences': _preferences
    }).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }

  void validateForm(Function signupProcessingCallback) {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      if (singupRequestProcessing) {
      } else {
        signupProcessingCallback();
        httpHelpers
            .signupRequest(_userName, _password, _userEmail)
            .then((String response) {
          signupProcessingCallback();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Notice"),
                content: Text(response == 'Signup Successful'
                    ? 'Signup Successful! Please login.'
                    : response == 'Email Already Exists'
                        ? 'Email already in use. Please try again.'
                        : response == 'Username Already Exists'
                            ? 'Username already in use. Please try again.'
                            : 'Signup Failed. Please try again.'),
                actions: [
                  TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        if (response == 'Signup Successful') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      })
                ],
              );
            },
          );
        });
      }
    }
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

  Widget signUpButton() {
    return SizedBox(
      width: 250,
      height: 36,
      child: ElevatedButton(
        onPressed: () async {
          final message = await AuthService().registration(
            email: _userEmail,
            password: _password,
          );
          if (message!.contains('Success')) {
            addUser();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        child: const Text('Sign Up'),
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

  Widget emailField() {
    return Container(
      margin: const EdgeInsets.only(right: 40, left: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
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

  Widget projectName() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        'Ichthyolog',
        style: TextStyle(
          fontSize: 50,
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
