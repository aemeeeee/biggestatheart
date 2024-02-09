import 'package:flutter/material.dart';
import '../Routes/login.dart';
import 'login_background.dart';
import '../Helpers/Firebase_Services/signup.dart';
import '../Helpers/Authentication/auth_service.dart';

class SignUpPage3 extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String password;
  final String phoneNumber;
  final String name;
  final DateTime dob;
  final String ethnicity;
  final String gender;
  final String educationLevel;
  final String occupation;
  const SignUpPage3(
      {Key? key,
      required this.userName,
      required this.userEmail,
      required this.password,
      required this.phoneNumber,
      required this.name,
      required this.dob,
      required this.ethnicity,
      required this.gender,
      required this.educationLevel,
      required this.occupation})
      : super(key: key);
  @override
  SignUpPage3State createState() => SignUpPage3State();
}

class SignUpPage3State extends State<SignUpPage3> {
  String _interests = '';
  String _skills = '';
  String _preferences = '';
  final _formKey = GlobalKey<FormState>();
  final firebaseServiceSignup = FirebaseServiceSignup();
  bool signupRequestProcessing = false;

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
                  //arrow back button to signup page 2
                  backButton(),
                  //Logo up top
                  logo(),
                  //App Title
                  appTitle(),
                  //Interests field
                  interestsField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Skills field
                  skillsField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Preferences field
                  preferencesField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 22),
                  //Sign up button
                  signUpButton(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 22),
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }

  signupProcessingCallback() {
    setState(() {
      signupRequestProcessing = !signupRequestProcessing;
    });
  }

  Widget signUpButton() {
    return SizedBox(
        width: 250,
        height: 36,
        child: ElevatedButton(
            onPressed: () async {
              final bool? isValid = _formKey.currentState?.validate();
              if (isValid == true) {
                signupProcessingCallback();
                AuthService()
                    .registration(
                  email: widget.userEmail,
                  password: widget.password,
                )
                    .then((String message) {
                  signupProcessingCallback();
                  if (message.contains('Success')) {
                    firebaseServiceSignup.addUser(
                        widget.userEmail,
                        widget.userName,
                        widget.password,
                        widget.phoneNumber,
                        widget.name,
                        widget.dob,
                        widget.ethnicity,
                        widget.gender,
                        widget.educationLevel,
                        widget.occupation,
                        _interests,
                        _skills,
                        _preferences);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  }
                });
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
                        'Please make sure you have entered your personal details correctly.',
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        TextButton(
                            child: const Text("OK",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 119, 71, 71))),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    );
                  },
                );
              }
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
            child: const Text(
              'Sign Up',
              style: TextStyle(color: Color.fromARGB(255, 119, 71, 71)),
            )));
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

  Widget interestsField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your personal interests';
          } else {
            return null;
          }
        },
        onChanged: (value) => _interests = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your personal interests',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget skillsField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your notable skills';
          } else {
            return null;
          }
        },
        onChanged: (value) => _interests = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your notable skills',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget preferencesField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter any volunteering preferences';
          } else {
            return null;
          }
        },
        onChanged: (value) => _interests = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your volunteering preferences',
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
          color: const Color.fromARGB(255, 149, 67, 67),
          iconSize: 35,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context)),
    );
  }
}
