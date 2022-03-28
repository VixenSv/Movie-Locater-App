import 'package:flutter/material.dart';

import 'features/presentation/pages/Home.page.dart';
import 'features/presentation/pages/MovieList.page.dart';

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
        routes: {
          '/home': (context) => HomePage(MovieListPage(), 'Movie List')
        });
  }
}
