import 'package:flutter/material.dart';
import 'package:riverpod_inifinit_route/user.dart';

/// State class for follower list page.
class FollowerPageState extends ChangeNotifier {
  final followerList = <User>[];

  /// update the follower list with given data
  void update(Iterable<User> newList) {
    followerList.clear();
    followerList.addAll(newList);
    notifyListeners();
  }
}
