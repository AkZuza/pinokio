import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pinokio/data/database.dart';
import 'package:pinokio/models/message.dart';

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
  TextEditingController textEditingController = TextEditingController();
  var db = DiaryDataBase();

  @override
  void initState() {
    var box = Hive.box('mybox');
    if (box.get('diary') == null) {
      box.put('diary', []);
    }

    db.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Main content of your screen

            Expanded(
              child: ListView.builder(
                  itemCount: db.messages.length,
                  itemBuilder: (context, index) {
                    return Text(db.messages[index]);
                  }),
            ),

            // Bottom row container
            Container(
              height: 60, // Adjust height as needed
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: textEditingController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Dear Diary...',
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      var entry = textEditingController.text;
                      db.messages.add(entry);
                      db.updateDatabase();
                      textEditingController.clear();

                      setState(() {});
                    },
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
