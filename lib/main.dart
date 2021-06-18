import 'package:flutter/material.dart';
import 'package:health_solution_app/screens/homepage_2.dart';
// import 'package:health_solution_app/screens/homepge.dart';
// import 'package:health_solution_app/screens/pageview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'Poppins',
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondHomePage(),
    );
  }
}

