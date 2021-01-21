import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_inifinit_route/state/follower_page_state.dart';
import 'package:riverpod_inifinit_route/user.dart';

main() {
  test('the number of followers is 5 after updating with 5 users list.', () {
    final state = FollowerPageState();
    state.update([
      User(1, 'Alice', false, [2, 3, 6]),
      User(2, 'Bob', false, [1, 5, 6, 7, 8]),
      User(3, 'Charls', false, [2]),
      User(4, 'David', false, [6, 7, 8]),
      User(5, 'Ellen', false, [1, 2, 7, 8, 9]),
    ]);
    expect(state.followerList.length, 5);
  });

  test(
      'the number of followers is 4 after calling update() twice with 4 users list.',
      () {
    final state = FollowerPageState();
    state.update([
      User(1, 'Alice', false, [2, 3, 6]),
      User(2, 'Bob', false, [1, 5, 6, 7, 8]),
      User(3, 'Charls', false, [2]),
      User(4, 'David', false, [6, 7, 8]),
      User(5, 'Ellen', false, [1, 2, 7, 8, 9]),
    ]);

    state.update([
      User(6, 'Fox', false, [1, 2, 3]),
      User(7, 'Greg', false, [4, 9]),
      User(8, 'Henry', false, [5]),
      User(9, 'Iggy', false, [1, 2, 3, 4, 5, 6, 7, 8]),
    ]);
    expect(state.followerList.length, 4);
  });
}
