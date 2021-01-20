import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_inifinit_route/main.dart';
import 'package:riverpod_inifinit_route/page/follower_page.dart';
import 'package:riverpod_inifinit_route/state/user_page_state.dart';
import 'package:riverpod_inifinit_route/widget/follow_button.dart';

final _followerProvider =
    ChangeNotifierProvider.family<UserPageState, int>((ref, id) {
  final allUsers = ref.watch(allUsersProvider);
  return UserPageState()..user = allUsers.users[id];
});

/// Page for user with given [id]
class UserPage extends ConsumerWidget {
  final int id;

  const UserPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(_followerProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(state.user.name),
        actions: [
          FollowButton(targetUserId: id),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.user.name,
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FollowerPage(user: state.user),
                  ),
                );
              },
              child: Text(
                '${state.user.followerCount} Followers',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
