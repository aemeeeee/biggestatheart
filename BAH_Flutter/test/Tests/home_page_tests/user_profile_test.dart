import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  //logged in user fetches profile info
  test('User should fetch profile info successfully', () async {
    String jwt = '';
    await httpHelpers
        .loginRequest('tester9', 'tester9', 'Tester9!')
        .then((response) {
      expect(JwtDecoder.decode(response)['username'], 'tester9');
      jwt = response;
    });
    await httpHelpers.viewOwnUserProfileRequest(jwt).then((response) {
      expect(response.username, 'tester9');
    });
  });

  //user fetches profile info without logging in
  test('User should fail to fetch profile info', () async {
    String jwt = '';

    expect(
      () async => await httpHelpers.viewOwnUserProfileRequest(jwt),
      throwsA(
        isA<FormatException>().having(
          (error) => error.toString(),
          'error message',
          contains('jwt must be provided'),
        ),
      ),
    );
  });
}
