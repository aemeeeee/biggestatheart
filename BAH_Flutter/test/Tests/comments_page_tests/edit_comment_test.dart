import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  test('User should edit comments successfully', () async {
    String jwt = '';
    await httpHelpers
        .loginRequest('testuser2@gmail.com', 'testuser2', 'Testuser2!')
        .then((response) {
      expect(JwtDecoder.decode(response)['username'], 'testuser2');
      jwt = response;
    });
    await httpHelpers
        .addCommentRequest(58, 'test comment', false, jwt)
        .then((response) {
      expect(response, 'Comment Posted');
    });
    await httpHelpers.viewPostCommentsRequest(58).then((response) async {
      await httpHelpers
          .editCommentRequest(response[0].commentId, 'test comment edited', jwt)
          .then((response) {
        expect(response, 'Comment Edited');
      });
      await httpHelpers
          .deleteCommentRequest(response[0].commentId, jwt)
          .then((response) {
        expect(response, 'Comment Deleted');
      });
    });
  });
}
