import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  // First time data
  void createInitialData() {
    toDoList = [
      ["Wake up", true],
      ["Meow", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

class DiaryDataBase {
  List messages = [];
  final _myBox = Hive.box('mybox');

  void loadData() {
    messages = _myBox.get('diary');
  }

  void updateDatabase() {
    _myBox.put('diary', messages);
  }
}
