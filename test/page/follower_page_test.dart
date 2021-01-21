import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_inifinit_route/main.dart';
import 'package:riverpod_inifinit_route/page/follower_page.dart';
import 'package:riverpod_inifinit_route/state/all_users_state.dart';
import 'package:riverpod_inifinit_route/user.dart';

main() {
  testWidgets(
      '5 cards are shown on ListView when passing User object with 5 followers',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: FollowerPage(user: User(2, 'Bob', false, [1, 5, 6, 7, 8])),
        ),
      ),
    );

    expect(find.byType(Card), findsNWidgets(5));
  });

  group('sample test cases using FakeAllUsersState', () {
    testWidgets(
        '"Fake Alice" is shown on first Card of ListView when passing User object following id:1',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            allUsersProvider.overrideWithProvider(
              ChangeNotifierProvider<AllUsersState>((ref) {
                return FakeAllUsersState();
              }),
            )
          ],
          child: MaterialApp(
            home: FollowerPage(user: User(3, 'Test David', false, [1, 2])),
          ),
        ),
      );

      expect(find.text('Fake Alice'), findsOneWidget);
    });
  });
}

/// Fake State class of AllUsersState
class FakeAllUsersState extends AllUsersState {
  @override
  Map<int, User> get users => <int, User>{
        1: User(1, 'Fake Alice', false, []),
        2: User(2, 'Fake Bob', false, [1]),
        3: User(3, 'Fake Charls', false, [1, 2]),
      };
}
