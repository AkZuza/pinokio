import 'package:flutter/material.dart';

AppBar diaryAppBar = AppBar(
  title: Text("Diary"),
  backgroundColor: Colors.brown[300],
);

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _DiaryState();
}

class _DiaryState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Diary"),
    );
  }
}
