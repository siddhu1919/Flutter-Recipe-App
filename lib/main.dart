// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipe_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Delecious Recipes",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
        // appBarTheme: const AppBarTheme(
        //   titleTextStyle: TextStyle(
        //       color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        // ),
      ),
      home: LoginPage(),
    );
  }
}
