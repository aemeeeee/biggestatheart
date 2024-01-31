import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  //user fetches post using correct postid
  test('User should fetch post info successfully', () async {
    int postid = Random().nextInt(3) + 57;
    await httpHelpers.viewPostRequest(postid).then((response) {
      expect(response.postid, postid);
    });
  });

  //user fetches post using incorrect postid
  test('User should fail to fetch post info', () async {
    int postId = -(Random().nextInt(200));

    expect(
      () async => await httpHelpers.viewPostRequest(postId),
      throwsA('Post Not Found'),
    );
  });
}
