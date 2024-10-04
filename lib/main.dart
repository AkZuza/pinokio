import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './home_page.dart';

void main() {
  // runApp(const DiaryApp());
  runApp(const Pinokio());
}

class Pinokio extends StatelessWidget {
  const Pinokio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        // scaffoldBackgroundColor: Colors.black),
      ),
      home: const HomePage(),
    );
  }
}
// class DiaryApp extends StatelessWidget {
//   const DiaryApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
