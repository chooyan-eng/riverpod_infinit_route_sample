import 'package:flutter/material.dart';
import 'package:riverpod_inifinit_route/user.dart';

/// State class for user page
class UserPageState extends ChangeNotifier {
  User _user;
  User get user => _user;
  set user(User value) {
    _user = value;
    notifyListeners();
  }
}
