import 'package:flutter/material.dart';
import 'package:layout_task/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: const Color(0xFF3F51F3)),
      ),
      home: const MyHomePage(),
    );
  }
}
