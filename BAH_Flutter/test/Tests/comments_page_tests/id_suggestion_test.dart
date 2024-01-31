@Timeout(Duration(seconds: 45))
import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ichthyolog/Helpers/http.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  final httpHelpers = HttpHelpers();

  test('User should perform ID suggestion successfully', () async {
    String jwt = '';
    int value = Random().nextInt(200) + 100;
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
    });
    //post a new test sighting
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
    //look for the new post
    await httpHelpers.viewOwnPostsRequest(jwt).then((viewPostResponse) async {
      //add an ID suggestion under the post
      await httpHelpers
          .addIdSuggestionRequest(viewPostResponse[0].postid,
              'Black Eeltail Catfish, Torsat (Plotosus canius)', jwt)
          .then((response) {
        expect(response, 'ID suggestion posted successfully!');
      });
      //add another ID suggestion under the post
      await httpHelpers
          .addIdSuggestionRequest(viewPostResponse[0].postid,
              'Black Eeltail Catfish, Torsat (Plotosus canius)', jwt)
          .then((response) {
        expect(response, 'ID suggestion posted successfully!');
      });
      //login to an expert account
      await httpHelpers
          .loginRequest('kagome', 'kagome', 'Kagome123!')
          .then((response) {
        expect(JwtDecoder.decode(response)['username'], 'kagome');
        jwt = response;
      });
      //look for the ID suggestions under the post
      await httpHelpers
          .viewPostCommentsRequest(viewPostResponse[0].postid)
          .then((viewCommentResponse) async {
        //reject the first ID suggestion
        await httpHelpers
            .rejectIdSuggestionRequest(
                viewCommentResponse[0].commentId, jwt, 'test rejection')
            .then((response) {
          expect(response, 'ID Suggestion Rejected');
        });
        //accept the second ID suggestion
        await httpHelpers
            .acceptIdSuggestionRequest(
                viewPostResponse[0].postid,
                viewCommentResponse[1].commentId,
                'Black Eeltail Catfish, Torsat (Plotosus canius)',
                jwt)
            .then((response) {
          expect(response, 'ID Suggestion Accepted');
        });
      });
      //login back to the new account
      await httpHelpers
          .loginRequest(email, username, password)
          .then((response) {
        expect(JwtDecoder.decode(response)['username'], username);
        jwt = response;
      });
      //delete the new account
      await httpHelpers.deleteUserRequest(jwt).then((response) {
        expect(response, 'User Deleted');
      });
    });
  });
}
