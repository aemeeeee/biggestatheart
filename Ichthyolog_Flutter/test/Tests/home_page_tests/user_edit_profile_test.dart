@Timeout(Duration(seconds: 45))
import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:math';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  test('User should edit profile info successfully', () async {
    String jwt = '';
    int value = Random().nextInt(200) + 100;
    int value2 = Random().nextInt(200) + 100;
    String username = 'tester$value';
    String email = 'tester$value@hotmail.com';
    String password = 'Tester$value!';
    //create a new account
    await httpHelpers.signupRequest(username, password, email).then((response) {
      expect(response, 'Signup Successful');
    });
    //login to new account
    await httpHelpers.loginRequest(email, username, password).then((response) {
      expect(JwtDecoder.decode(response)['username'], username);
      jwt = response;
    });
    //edit email
    await httpHelpers
        .editUserProfileRequest(
            'tester$value2@hotmail.com', '', password, '', jwt)
        .then((response) {
      expect(response, 'User Edited');
    });
    //edit username
    await httpHelpers
        .editUserProfileRequest('', 'tester$value2', password, '', jwt)
        .then((response) {
      expect(response, 'User Edited');
    });
    //edit password
    await httpHelpers
        .editUserProfileRequest('', '', password, 'Tester$value2!', jwt)
        .then((response) {
      expect(response, 'User Edited');
    });
    //edit profile pic
    await httpHelpers
        .editUserProfilePicRequest(
            'https://ichthyolog.s3.ap-southeast-1.amazonaws.com/avatar5.png',
            jwt)
        .then((response) {
      expect(response, 'User Edited');
    });
    //delete user
    await httpHelpers.deleteUserRequest(jwt).then((response) {
      expect(response, 'User Deleted');
    });
  });
}
