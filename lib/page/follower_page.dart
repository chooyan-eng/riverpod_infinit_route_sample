import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_inifinit_route/main.dart';
import 'package:riverpod_inifinit_route/page/user_page.dart';
import 'package:riverpod_inifinit_route/state/follower_page_state.dart';
import 'package:riverpod_inifinit_route/user.dart';
import 'package:riverpod_inifinit_route/widget/follow_button.dart';

final _followerProvider =
    ChangeNotifierProvider.family<FollowerPageState, int>((ref, id) {
  final allUsers = ref.watch(allUsersProvider);
  final followerList = allUsers.users[id].followers.map(
    (followerId) => allUsers.users[followerId],
  );
  return FollowerPageState()..update(followerList);
});

/// Page for follower list of a user with given [id]
class FollowerPage extends ConsumerWidget {
  final User user;

  const FollowerPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(_followerProvider(user.id));
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers of ${user.name}'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: state.followerList.length,
            itemBuilder: (context, index) {
              final follower = state.followerList[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserPage(id: follower.id),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            follower.name,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        FollowButton(targetUserId: follower.id),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
