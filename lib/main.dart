import 'package:flutter/material.dart';

import 'ui/pages/edit_profile_page.dart';
import 'ui/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => ProfilePage(),
        '/edit_profile_page': (context) => EditProfilePage(),
      },
    );
  }
}
