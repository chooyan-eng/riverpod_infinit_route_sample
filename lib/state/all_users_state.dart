import 'package:flutter/material.dart';
import 'package:riverpod_inifinit_route/user.dart';

/// State class exposing all user data.
class AllUsersState extends ChangeNotifier {
  // all user data
  final users = <int, User>{
    1: User(1, 'Alice', false, [2, 3, 6]),
    2: User(2, 'Bob', false, [1, 5, 6, 7, 8]),
    3: User(3, 'Charls', false, [2]),
    4: User(4, 'David', false, [6, 7, 8]),
    5: User(5, 'Ellen', false, [1, 2, 7, 8, 9]),
    6: User(6, 'Fox', false, [1, 2, 3]),
    7: User(7, 'Greg', false, [4, 9]),
    8: User(8, 'Henry', false, [5]),
    9: User(9, 'Iggy', false, [1, 2, 3, 4, 5, 6, 7, 8]),
  };

  /// do follow a user with given ID
  void follow(int targetId) {
    users[targetId] = users[targetId].copyWithFollowing(true);
    notifyListeners();
  }

  /// unfollow a user with given ID
  void unfollow(int targetId) {
    users[targetId] = users[targetId].copyWithFollowing(false);
    notifyListeners();
  }
}
