// import 'dart:math';
import 'package:flutter/material.dart';
// import 'UI/widgets/search_and_menu.dart';
// import 'UI/widgets/front_view.dart';
// import 'UI/widgets/back_view.dart';
// import 'UI/widgets/action_buttons.dart';

final Color primaryColor = Color(0xff91735F);
final Color secondaryColor = Color(0xffd2bba0);
final Color backgroundColor = Color(0xfff2efc7);
final Color headerColor = Color(0xffffeee2);
final Color textColor = Color.fromARGB(255, 101, 76, 59);

final Color textColor2 = Color.fromARGB(255, 197, 177, 162);

void openDrawer() {}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "2/10/2024 : 2:12pm",
          style: TextStyle(color: textColor2),
        ),
        backgroundColor: primaryColor,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.mic),
            color: secondaryColor,
            iconSize: 30,
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dear Diary,",
                    style: TextStyle(fontSize: 40, color: textColor),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      style: TextStyle(color: textColor),
                      maxLines: null,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("Drawer Element"),
          )
        ],
      )),
    );
  }
}
