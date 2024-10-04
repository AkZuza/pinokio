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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Main content of your screen
            Expanded(child: Center(child: Text('Main Content'))),

            // Bottom row container
            Container(
              height: 60, // Adjust height as needed
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Enter text here',
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    color: Colors.brown,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
