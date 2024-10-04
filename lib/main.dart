import 'package:flutter/material.dart';
import 'package:pinokio/main_page.dart';
// import 'package:pinokio/pages/home_page.dart';
import "package:hive_flutter/hive_flutter.dart";
// import 'package:flutter/services.dart';
// import './home_page.dart';
// import './diary.dart';

void main() async {
  // runApp(const DiaryApp());
  await Hive.initFlutter();
  await Hive.openBox('mybox');
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
      home: MainPage(),
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
