import 'package:flutter_test/flutter_test.dart';
import 'package:ichthyolog/Helpers/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  final httpHelpers = HttpHelpers();

  //user fetches all posts
  test('User should edit post info and delete post successfully', () async {
    String jwt = '';
    int value = Random().nextInt(200) + 100;
    String username = 'tester$value';
    String email = 'tester$value@hotmail.com';
    String password = 'Tester$value!';
    await httpHelpers.signupRequest(username, password, email).then((response) {
      expect(response, 'Signup Successful');
    });
    await httpHelpers.loginRequest(email, username, password).then((response) {
      expect(JwtDecoder.decode(response)['username'], username);
      jwt = response;
    });
    await httpHelpers
        .uploadPostRequest(
            'title$value',
            'description$value',
            'sightingLocation$value',
            DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
            'imageURL$value',
            jwt,
            'class_$value',
            'order$value',
            'family$value',
            'genus$value',
            'species$value')
        .then(
      (response) {
        expect(response, 'Post Uploaded');
      },
    );
    await httpHelpers.viewOwnPostsRequest(jwt).then((response) async {
      await httpHelpers
          .editPostInfoRequest(
              response[0].postid,
              jwt,
              'title1',
              'description1',
              'location1',
              'class_1',
              'order2',
              'family3',
              'genus4',
              'species5')
          .then((response) {
        expect(response, 'Post Edited');
      });
      await httpHelpers
          .deletePostRequest(response[0].postid, jwt)
          .then((response) async {
        expect(response, 'Post Deleted');
      });
    });
    await httpHelpers.deleteUserRequest(jwt).then((response) {
      expect(response, 'User Deleted');
    });
  });
}
