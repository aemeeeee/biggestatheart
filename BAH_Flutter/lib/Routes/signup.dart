import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';
import '../Routes/login.dart';
import 'login_background.dart';
import '../Helpers/Firebase_Services/signup.dart';
import '../Helpers/Authentication/auth_service.dart';
import '../Helpers/Widgets/standard_widgets.dart';

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
  String _interests = '';
  String _skills = '';
  String _preferences = '';
  String _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  final firebaseServiceSignup = FirebaseServiceSignup();
  final TextEditingController ethnicityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
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

  bool isValidAge(int age) {
    if (age < 0 || age > 122) {
      return false;
    }
    return true;
  }

  signupProcessingCallback() {
    setState(() {
      singupRequestProcessing = !singupRequestProcessing;
    });
    print("CHANGED");
  }

  // void validateForm(Function signupProcessingCallback) {
  //   final bool? isValid = _formKey.currentState?.validate();
  //   if (isValid == true) {
  //     if (singupRequestProcessing) {
  //     } else {
  //       signupProcessingCallback();
  //       httpHelpers
  //           .signupRequest(_userName, _password, _userEmail)
  //           .then((String response) {
  //         signupProcessingCallback();
  //         showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: const Text("Notice"),
  //               content: Text(response == 'Signup Successful'
  //                   ? 'Signup Successful! Please login.'
  //                   : response == 'Email Already Exists'
  //                       ? 'Email already in use. Please try again.'
  //                       : response == 'Username Already Exists'
  //                           ? 'Username already in use. Please try again.'
  //                           : 'Signup Failed. Please try again.'),
  //               actions: [
  //                 TextButton(
  //                     child: const Text("OK"),
  //                     onPressed: () {
  //                       if (response == 'Signup Successful') {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => const LoginPage()),
  //                         );
  //                       } else {
  //                         Navigator.pop(context);
  //                       }
  //                     })
  //               ],
  //             );
  //           },
  //         );
  //       });
  //     }
  //   }
  // }

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
            firebaseServiceSignup.addUser(
                _userEmail,
                _userName,
                _password,
                _name,
                _age,
                _ethnicity,
                _gender,
                _education,
                _occupation,
                _interests,
                _skills,
                _preferences);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
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

  Widget appTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        'BiggestAtHeart',
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

  Widget ethnicityField() {
    return SelectableTextForm(
        controller: ethnicityController,
        labelText: 'Enter your ethnicity',
        leadingIcon: const Icon(null),
        options: const [
          "Chinese",
          "Malay",
          "Indian",
          "Pakistani",
          "Bangladeshi",
          "Caribbean",
          "African",
          "Any other Asian background"
              "Any other Black, Black British, or Caribbean background"
              "Any other Mixed or multiple ethnic background"
        ],
        updateCallback: ethnicityCallback,
        clearCallback: ethnicityClearCallback);
  }

  ethnicityCallback(newValue) {
    setState(() {
      _ethnicity = newValue;
    });
  }

  ethnicityClearCallback() {
    setState(() {
      _ethnicity = '';
      ethnicityController.clear();
    });
  }

  Widget genderField() {
    return SelectableTextForm(
        controller: genderController,
        labelText: 'Enter your gender',
        leadingIcon: const Icon(null),
        options: const [
          "Male",
          "Female",
          "Nonbinary",
          "Bigender",
          "Transgender",
          "Cisgender",
          "Gender Neutral"
        ],
        updateCallback: ethnicityCallback,
        clearCallback: ethnicityClearCallback);
  }

  genderCallback(newValue) {
    setState(() {
      _gender = newValue;
    });
  }

  genderClearCallback() {
    setState(() {
      _gender = '';
      genderController.clear();
    });
  }

  Widget educationField() {
    return SelectableTextForm(
        controller: educationController,
        labelText: 'Enter your highest education level',
        leadingIcon: const Icon(null),
        options: const [
          "Preschool",
          "Primary School",
          "Secondary School",
          "Polytechnic",
          "Junior College",
          "University",
          "Homeschooled"
        ],
        updateCallback: educationCallback,
        clearCallback: educationClearCallback);
  }

  educationCallback(newValue) {
    setState(() {
      _education = newValue;
    });
  }

  educationClearCallback() {
    setState(() {
      _education = '';
      educationController.clear();
    });
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
