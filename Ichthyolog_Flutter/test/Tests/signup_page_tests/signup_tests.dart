import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  //brand new user sign up with unique username and email
  test('Test user should successfully sign up', () async {
    int testerNumber = Random().nextInt(200);
    await httpHelpers
        .signupRequest(
            'Automated!@#%^&*()Tester$testerNumber',
            'AutomatedTester!@#%^&*()$testerNumber!!!',
            'automatedTester!@#%^&*()$testerNumber@gmail.com')
        .then(
      (response) {
        expect(response, 'Signup Successful');
      },
    );
  });

  //user signs up with existing username
  test('Test user should fail to sign up', () async {
    int testerNumber = Random().nextInt(200);
    await httpHelpers
        .signupRequest('tester7', 'AutomatedTester!@#%^&*()$testerNumber!!!',
            'automatedTester!@#%^&*()$testerNumber@gmail.com')
        .then(
      (response) {
        expect(response, 'Username Already Exists');
      },
    );
  });

  //user signs up with existing email
  test('Test user should fail to sign up', () async {
    int testerNumber = Random().nextInt(200);
    await httpHelpers
        .signupRequest('AutomatedTester!@#%^&*()$testerNumber',
            'AutomatedTester!@#%^&*()$testerNumber!!!', 'tester8@gmail.com')
        .then(
      (response) {
        expect(response, 'Email Already Exists');
      },
    );
  });
}
