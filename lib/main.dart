import 'package:flutter/material.dart';
import 'package:to_do_app/homePage.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Day',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
