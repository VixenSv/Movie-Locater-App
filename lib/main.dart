import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Locator',
        initialRoute: '/home',
        routes: {'/home': (context) => HomePage(ListPage(), 'Home')});
  }
}
