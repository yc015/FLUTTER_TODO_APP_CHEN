import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app_chen/screens/home.dart';

// Main function of this todo app
void main() {
  // Run our todo app
  runApp(const MyApp());
}

// Our todo app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build the root widget of our application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner which will be displayed in debug mode by default
      debugShowCheckedModeBanner: false,
      // The title of our application
      title: 'TODO APP',
      // The default root of our application
      home: Home(),
    );
  }
}
