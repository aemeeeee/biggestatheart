import 'package:flutter_test/flutter_test.dart';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  //user fetches all posts
  test('User should fetch all posts successfully', () async {
    await httpHelpers.viewAllPostsRequest().then((response) {
      expect(response.isNotEmpty, true);
    });
  });
}
