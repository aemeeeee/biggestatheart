import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:ichthyolog/Helpers/http.dart';

void main() {
  final httpHelpers = HttpHelpers();

  //user fetches post comments using correct postid
  test('User should fetch post comments successfully', () async {
    List<int> data = [22, 59, 131];
    int postid = data[Random().nextInt(2)];
    await httpHelpers.viewPostCommentsRequest(postid).then((response) {
      expect(response.isNotEmpty, true);
    });
  });

  //user fetches post comments using incorrect postid
  test('User should fail to fetch post comments', () async {
    int postId = -(Random().nextInt(200));

    expect(() async {
      await httpHelpers.viewPostCommentsRequest(postId);
    }, throwsA('Comments Not Found'));
  });
}
