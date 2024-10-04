import 'package:flutter/material.dart';

AppBar checklistAppBar = AppBar(
  title: Text("Checkist"),
  backgroundColor: Colors.brown[300],
);

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChecklistState();
}

class _ChecklistState extends State<ChecklistPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Checklist"),
    );
  }
}
