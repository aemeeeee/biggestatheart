import 'package:flutter/material.dart';
import '../Helpers/standard_widgets.dart';
import 'login_background.dart';
import 'signup.dart';
import '../Helpers/helper.dart';
import '../Helpers/http.dart';
import '../Models/user.dart';
import 'gallery_page.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailUsernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final httpHelpers = HttpHelpers();
  final helpers = Helpers();
  bool loginRequestProcessing = false;
  final User guestUser = User(
      userid: -1,
      username: 'dummyUsername',
      password: 'dummyPassword',
      email: 'dummyEmail',
      pfp: 'dummyPfp',
      level: 0,
      speciesCount: 0,
      postCount: 0,
      isExpert: false,
      upvotedComments: [],
      downvotedComments: []);

  loginProcessingCallback() {
    setState(() {
      loginRequestProcessing = !loginRequestProcessing;
    });
  }

  // check if information filled in is valid, or if the log in request is successful
  void validateForm(Function loginProcessingCallback) {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      if (loginRequestProcessing) {
        null;
      } else {
        loginProcessingCallback();
        httpHelpers
            .loginRequest(emailUsernameController.text,
                emailUsernameController.text, passwordController.text)
            .then((String response) async {
          loginProcessingCallback();
          if (response != 'Password Incorrect' &&
              response != 'User Not Found' &&
              response != 'Error') {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString("jwt", response);
            if (context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return NoticeDialog(
                      content: response == 'Error'
                          ? 'Error. Please try again.'
                          : response == 'Password Incorrect'
                              ? 'Incorrect password. Please try again.'
                              : 'User not found. Please try again.');
                });
          }
        });
      }
    }
  }

  Widget logo() {
    return Container(
      width: 170,
      height: 170,
      margin: const EdgeInsets.only(top: 100),
      child: Image.asset('assets/images/Logo.png'),
    );
  }

  Widget projectName() {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
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

  Widget emailField() {
    return Container(
      margin: const EdgeInsets.only(right: 40, left: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email cannot be empty';
          }
          return null;
        },
        controller: emailUsernameController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your email or username',
          contentPadding: EdgeInsets.all(10),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your password',
          contentPadding: EdgeInsets.all(15),
        ),
      ),
    );
  }

  // Widget forgotPasswordButton() {
  //   return Container(
  //     margin: const EdgeInsets.only(right: 40, left: 40),
  //     child: Align(
  //       alignment: Alignment.topRight,
  //       child: TextButton(
  //         onPressed: () {
  //           // TODO: implement reset password functionality
  //         },
  //         child: const Text('Forgot Password?'),
  //       ),
  //     ),
  //   );
  // }

  Widget loginButton() {
    return SizedBox(
      width: 250,
      height: 36,
      child: ElevatedButton(
        onPressed: () {
          validateForm(loginProcessingCallback);
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        child: const Text('Login'),
      ),
    );
  }

  Widget signupButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Don\'t have an account?'),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPage()),
          );
        },
        child: const Text('Sign up'),
      ),
    ]);
  }

  Widget galleryButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GalleryPage(currUser: guestUser)),
          );
        },
        child: const Text('Use this app without an account',
            style: TextStyle(color: Color.fromARGB(255, 80, 154, 239))),
      ),
    ]);
  }

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
                children: <Widget>[
                  //Logo up top
                  logo(),

                  //Project name
                  projectName(),

                  //Email field
                  emailField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),

                  //Password field
                  passwordField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 20),

                  //Login button
                  loginButton(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 28),

                  //Sign up button
                  signupButton(),

                  //Visit gallery directly button
                  galleryButton()
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
