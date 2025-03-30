import 'package:agl_quiz/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AGL Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(brightness: Brightness.dark,
        ),
        fontFamily: "inter",
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
