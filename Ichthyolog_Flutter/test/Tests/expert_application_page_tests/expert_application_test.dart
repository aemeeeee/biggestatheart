@Timeout(Duration(seconds: 45))
import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ichthyolog/Helpers/http.dart';
import 'dart:math';

void main() {
  final httpHelpers = HttpHelpers();

  test('User should work with expert applications successfully', () async {
    String jwt = '';
    int userid = 0;
    int value = Random().nextInt(200) + 300;
    int contact = Random().nextInt(9999999) + 10000000;
    String username = 'tester$value';
    String email = 'tester$value@hotmail.com';
    String password = 'Tester$value!';
    //create a new account
    await httpHelpers.signupRequest(username, password, email).then((response) {
      expect(response, 'Signup Successful');
    });
    //login to the new account
    await httpHelpers.loginRequest(email, username, password).then((response) {
      expect(JwtDecoder.decode(response)['username'], username);
      jwt = response;
      userid = JwtDecoder.decode(response)['userid'];
    });
    //submit an expert application
    await httpHelpers
        .addExpertApplicationRequest(userid, 'name', 20, 'male', 'occupation',
            'email', contact, 'credentials', jwt)
        .then((response) {
      expect(response, 'Application added successfully!');
    });
    //look for the submitted application
    await httpHelpers
        .viewOwnExpertApplicationsRequest(userid, jwt)
        .then((viewApplicationResponse) async {
      //login to expert account
      await httpHelpers
          .loginRequest('kagome', 'kagome', 'Kagome123!')
          .then((response) {
        expect(JwtDecoder.decode(response)['username'], 'kagome');
        jwt = response;
      });
      //reject the application
      await httpHelpers
          .rejectExpertApplicationRequest(
              viewApplicationResponse[0].applicationId, 'test rejection', jwt)
          .then((response) {
        expect(response, 'Application rejected successfully!');
      });
      //delete the application
      await httpHelpers
          .deleteExpertApplicationRequest(
              viewApplicationResponse[0].applicationId, jwt)
          .then((response) {
        expect(response, 'Application deleted successfully!');
      });
    });
    //login back to the new account
    await httpHelpers.loginRequest(email, username, password).then((response) {
      expect(JwtDecoder.decode(response)['username'], username);
      jwt = response;
      userid = JwtDecoder.decode(response)['userid'];
    });
    //add another expert application
    await httpHelpers
        .addExpertApplicationRequest(userid, 'name', 20, 'male', 'occupation',
            'email', contact, 'credentials', jwt)
        .then((response) {
      expect(response, 'Application added successfully!');
    });
    //look for the newly added application
    await httpHelpers
        .viewOwnExpertApplicationsRequest(userid, jwt)
        .then((viewApplicationResponse) async {
      //login to expert account
      await httpHelpers
          .loginRequest('kagome', 'kagome', 'Kagome123!')
          .then((response) {
        expect(JwtDecoder.decode(response)['username'], 'kagome');
        jwt = response;
      });
      //approve the application
      await httpHelpers
          .approveExpertApplicationRequest(
              userid, viewApplicationResponse[0].applicationId, jwt)
          .then((response) {
        expect(response, 'Application approved successfully!');
      });
    });
    //login back to new account
    await httpHelpers.loginRequest(email, username, password).then((response) {
      expect(JwtDecoder.decode(response)['username'], username);
      jwt = response;
      userid = JwtDecoder.decode(response)['userid'];
    });
    //delete new account
    await httpHelpers.deleteUserRequest(jwt).then((response) {
      expect(response, 'User Deleted');
    });
  });
}
