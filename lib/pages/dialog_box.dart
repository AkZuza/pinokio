// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pinokio/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Colors.brown[200],
      content: SizedBox(
        height: 115,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(text: "Cancel", onPressed: onCancel),
                MyButton(text: "Add", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
