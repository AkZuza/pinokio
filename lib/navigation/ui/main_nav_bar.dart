import 'package:flutter/material.dart';
import 'package:pinokio/navigation/destinations.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key, required this.updateSelectedIndex});

  final Function(int) updateSelectedIndex;

  @override
  State<StatefulWidget> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: topLevelDestinations,
      selectedIndex: index,
      onDestinationSelected: super.widget.updateSelectedIndex,
    );
  }
}

const navigationBarThemeData =
    NavigationBarThemeData(backgroundColor: Colors.brown);
