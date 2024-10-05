import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinokio/models/message.dart';
import 'package:pinokio/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

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

  var messages = List<ChatMessage>.empty(growable: true);

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
      body: Stack(
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.brown[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     // decoration: BoxDecoration(
                  //     //   color: Colors.lightBlue,
                  //     //   borderRadius: BorderRadius.circular(30),
                  //     // ),
                  //     child: Icon(
                  //       Icons.add,
                  //       color: Colors.brown,
                  //       size: 20,
                  //       //ashwin what does 10^-23 mean?
                  //       //its 2e-3 some random
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          hintText: "Dear Diary...",
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      var entry = textEditingController.text;

                      final jsonData = jsonEncode({"message": entry});
                      final uri = "http://127.0.0.1:8000/greet?query=$jsonData";

                      messages.add(ChatMessage(
                          messageContent: entry, messageType: "sender"));
                      db.messages.add(entry);

                      setState(() {});

                      var resp =
                          await http.get(Uri.parse(uri)).whenComplete(() {});

                      var json = jsonDecode(resp.body);

                      db.updateDatabase();
                      setState(() {
                        messages.add(ChatMessage(
                            messageContent: json["message"],
                            messageType: "receiver"));
                      });
                      textEditingController.clear();
                    },
                    backgroundColor: Colors.brown,
                    elevation: 0,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
