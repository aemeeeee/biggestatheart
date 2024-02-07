import 'package:flutter/material.dart';
import 'login_background.dart';
import '../Helpers/Firebase_Services/signup.dart';
import '../Helpers/Widgets/standard_widgets.dart';
import 'signup_page_3.dart';

class SignUpPage2 extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String password;
  const SignUpPage2(
      {Key? key,
      required this.userName,
      required this.userEmail,
      required this.password})
      : super(key: key);
  @override
  SignUpPage2State createState() => SignUpPage2State();
}

class SignUpPage2State extends State<SignUpPage2> {
  String _name = '';
  int _age = 0;
  String _ethnicity = '';
  String _gender = '';
  String _education = '';
  String _occupation = '';
  final _formKey = GlobalKey<FormState>();
  final firebaseServiceSignup = FirebaseServiceSignup();
  final TextEditingController ethnicityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController educationController = TextEditingController();

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
                  //arrow back button to signup page 1
                  backButton(),
                  //Logo up top
                  logo(),
                  //App Title
                  appTitle(),
                  //Name field
                  nameField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Age field
                  ageField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Ethnicity field
                  ethnicityField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Gender field
                  genderField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Education field
                  educationField(),
                  SizedBox(height: MediaQuery.of(context).size.height * 1 / 40),
                  //Occupation field
                  occupationField(),
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

  bool isValidAge(int age) {
    if (age < 0 || age > 122) {
      return false;
    }
    return true;
  }

  Widget nextButton() {
    return SizedBox(
        width: 250,
        height: 36,
        child: ElevatedButton(
            onPressed: () async {
              final bool? isValid = _formKey.currentState?.validate();

              if (isValid == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage3(
                            userName: widget.userName,
                            userEmail: widget.userEmail,
                            password: widget.password,
                            name: _name,
                            age: _age,
                            gender: _gender,
                            ethnicity: _ethnicity,
                            educationLevel: _education,
                            occupation: _occupation,
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
                        'Please make sure you have entered your personal details correctly.',
                        style: TextStyle(fontSize: 18),
                      ),
                      actions: [
                        TextButton(
                            child: const Text("OK",
                                style: TextStyle(fontSize: 16)),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    );
                  },
                );
              }
            },
            child: const Text(
              'Next',
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

  Widget nameField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          } else {
            return null;
          }
        },
        onChanged: (value) => _name = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your name',
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }

  Widget ageField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          int valueNum = int.parse(value ?? "-1");
          if (value == null || value.isEmpty) {
            return 'Please enter your age';
          } else if (!isValidAge(valueNum)) {
            return 'Please enter a valid age.';
          } else {
            return null;
          }
        },
        onChanged: (value) => _age = (value is int) ? value as int : 0,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your age',
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

  Widget occupationField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.only(right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your occupation or school';
          } else {
            return null;
          }
        },
        onChanged: (value) => _occupation = value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter your occupation or school',
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
            onPressed: () => Navigator.pop(context)));
  }
}
