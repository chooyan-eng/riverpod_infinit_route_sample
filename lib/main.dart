import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:riverpod_inifinit_route/page/user_page.dart';
import 'package:riverpod_inifinit_route/state/all_users_state.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final allUsersProvider = ChangeNotifierProvider<AllUsersState>((ref) {
  return AllUsersState();
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Infinit Route Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserPage(id: 1), // show UserPage with id=1 as a first page.
    );
  }
}
