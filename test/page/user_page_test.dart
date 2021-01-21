import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_inifinit_route/page/user_page.dart';

main() {
  testWidgets('"Alice" is shown on AppBar and page body when passing id: 1',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: UserPage(id: 1),
        ),
      ),
    );

    expect(find.text('Alice'), findsNWidgets(2));
    expect(find.text('Bob'), findsNothing);
  });

  testWidgets('follower count is 5 when passing id: 2', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: UserPage(id: 2),
        ),
      ),
    );

    expect(find.text('5 Followers'), findsOneWidget);
  });

  testWidgets('follower count is 6 after tapping follow button',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: UserPage(id: 2),
        ),
      ),
    );

    expect(find.text('5 Followers'), findsOneWidget);

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(find.text('6 Followers'), findsOneWidget);
  });
}
