import 'package:flutter_test/flutter_test.dart';
import 'package:ichthyolog/Helpers/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() {
  final httpHelpers = HttpHelpers();

  //user logs in using right email and right password
  test('User should login successfully', () async {
    await httpHelpers
        .loginRequest('tester8@gmail.com', 'tester8@gmail.com', 'Tester8!')
        .then(
      (response) {
        expect(JwtDecoder.decode(response)['username'], 'tester8');
      },
    );
  });

  //user logs in using right username and right password
  test('User should login successfully', () async {
    await httpHelpers.loginRequest('tester8', 'tester8', 'Tester8!').then(
      (response) {
        expect(JwtDecoder.decode(response)['username'], 'tester8');
      },
    );
  });

  //user logs in using right username and wrong password
  test('User should see password incorrect error', () async {
    await httpHelpers
        .loginRequest('tester8', 'tester8', 'Incorrectpassword!')
        .then(
      (response) {
        expect(response, 'Password Incorrect');
      },
    );
  });

  //user logs in using wrong username
  test('User should see user does not exist error', () async {
    await httpHelpers
        .loginRequest(
            'nonexistenttester', 'nonexistenttester', 'irrelevantpassword')
        .then(
      (response) {
        expect(response, 'User Not Found');
      },
    );
  });

  //user logs in using wrong email
  test('User should see user does not exist error', () async {
    await httpHelpers
        .loginRequest('nonexistenttester@gmail.com',
            'nonexistenttester@gmail.com', 'irrelevantpassword')
        .then(
      (response) {
        expect(response, 'User Not Found');
      },
    );
  });
}
