import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_inifinit_route/main.dart';

/// Commonly used action button for following / unfollowing.
/// This widget directly access [AllUsersState] and change it's state when tapped.
class FollowButton extends ConsumerWidget {
  final int targetUserId;

  const FollowButton({
    Key key,
    this.targetUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(allUsersProvider);
    final targetUser = state.users[targetUserId];

    return targetUser.isFollowing
        ? IconButton(
            icon: Icon(Icons.favorite, color: Colors.amber),
            onPressed: () => state.unfollow(targetUser.id),
          )
        : IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => state.follow(targetUser.id),
          );
  }
}
