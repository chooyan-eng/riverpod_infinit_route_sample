import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_inifinit_route/state/user_page_state.dart';
import 'package:riverpod_inifinit_route/user.dart';

main() {
  test('exposed user name is "Bob" after setting User object with name "Bob"',
      () {
    final state = UserPageState();
    state.user = User(2, 'Bob', false, [1, 5, 6, 7, 8]);
    expect(state.user.name, 'Bob');
  });

  test(
      'exposed user name is "Iggie" after overwriting User object with name "Iggie"',
      () {
    final state = UserPageState();
    state.user = User(2, 'Bob', false, [1, 5, 6, 7, 8]);
    state.user = User(9, 'Iggy', false, [1, 2, 3, 4, 5, 6, 7, 8]);
    expect(state.user.name, 'Iggy');
  });
}
