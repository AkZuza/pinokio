import 'package:flutter/material.dart';

final Color primaryColor = Color(0xff91735F);
final Color secondaryColor = Color(0xffd2bba0);
final Color backgroundColor = Color(0xfff2efc7);
final Color headerColor = Color(0xffffeee2);
final Color textColor = Color.fromARGB(255, 101, 76, 59);

final Color textColor2 = Color.fromARGB(255, 197, 177, 162);

// Function to process user input with AI (replace with your actual implementation)
Future<String> processEntry(String text) async {
  // Simulate AI processing
  await Future.delayed(const Duration(seconds: 1)); // Simulate processing time
  return "AI Analysis: $text seems like a positive entry.";
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

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
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final processedText = await processEntry(_textController.text);
              // Display AI analysis below the text field
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(processedText),
                ),
              );
            },
            icon: Icon(Icons.mic_rounded),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Dear Diary,",
                      style: TextStyle(fontSize: 40, color: textColor),
                    ),
                  ),
                  TextField(
                    controller: _textController,
                    style: TextStyle(color: textColor),
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Write your thoughts here...',
                      hintStyle: TextStyle(color: textColor2),
                    ),
                  ),
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
              child: Text("Menu"),
            ),
            // Add additional drawer items for settings, analysis history, etc.
          ],
        ),
      ),
    );
  }
}
