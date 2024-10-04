import 'package:flutter/material.dart';
import 'package:pinokio/navigation/destinations.dart';
import 'package:pinokio/pages/checklist_page.dart';
import 'package:pinokio/pages/diary_page.dart';
import 'package:pinokio/pages/check_page.dart';
import 'package:pinokio/pages/notes_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 1;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List appBars = [notesAppBar, diaryAppBar, checklistAppBar];
  final List screens = [NotesPage(), DiaryPage(), CheckPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      appBar: appBars[selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: topLevelDestinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: updateSelectedIndex,
        backgroundColor: Colors.brown[300],
        indicatorColor: Colors.brown,
      ),
    );
  }
}
