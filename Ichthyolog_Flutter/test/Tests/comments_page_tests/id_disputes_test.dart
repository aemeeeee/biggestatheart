@Timeout(Duration(seconds: 45))
import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ichthyolog/Helpers/http.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  final httpHelpers = HttpHelpers();

  test('User should perform ID disputing successfully', () async {
    String jwt = '';
    int value = Random().nextInt(200) + 200;
    String username = 'tester$value';
    String email = 'tester$value@hotmail.com';
    String password = 'Tester$value!';
    //create new account
    await httpHelpers.signupRequest(username, password, email).then((response) {
      expect(response, 'Signup Successful');
    });
    //login to new account
    await httpHelpers.loginRequest(email, username, password).then((response) {
      expect(JwtDecoder.decode(response)['username'], username);
      jwt = response;
    });
    //post a test sighting
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
    //find our uploaded post
    await httpHelpers.viewOwnPostsRequest(jwt).then((viewPostResponse) async {
      //add a test suggestion under the post
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
      //look for comments under the post
      await httpHelpers
          .viewPostCommentsRequest(viewPostResponse[0].postid)
          .then((viewCommentResponse) async {
        //approve the ID suggestion
        await httpHelpers
            .acceptIdSuggestionRequest(
                viewPostResponse[0].postid,
                viewCommentResponse[0].commentId,
                'Black Eeltail Catfish, Torsat (Plotosus canius)',
                jwt)
            .then((response) {
          expect(response, 'ID Suggestion Accepted');
        });
        //dispute the accepted ID suggestion
        await httpHelpers
            .addDisputeRequest(
                viewCommentResponse[0].commentId, 'test dispute', jwt)
            .then((response) {
          expect(response, 'Dispute added successfully!');
        });
        //login back to the new account
        await httpHelpers
            .loginRequest(email, username, password)
            .then((response) {
          expect(JwtDecoder.decode(response)['username'], username);
          jwt = response;
        });
        //look for disputes under the approved ID suggestion
        await httpHelpers
            .viewDisputesRequest(viewCommentResponse[0].commentId)
            .then((viewDisputesResponse) async {
          //approve the ID suggestion
          await httpHelpers
              .approveDisputeRequest(
                  viewCommentResponse[0].commentId,
                  viewDisputesResponse[0].disputeId,
                  viewPostResponse[0].postid,
                  jwt)
              .then((response) {
            expect(response, 'Dispute approved successfully');
          });
        });
      });
      //delete newly created account
      await httpHelpers.deleteUserRequest(jwt).then((response) {
        expect(response, 'User Deleted');
      });
    });
  });
}
