import 'package:flutter/material.dart';

AppBar notesAppBar = AppBar(
  title: Text("Notes"),
  backgroundColor: Colors.brown[300],
);

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<StatefulWidget> createState() => _NotesState();
}

class _NotesState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Notes"),
    );
  }
}
