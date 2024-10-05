import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar notesAppBar = AppBar(
  title: Text("Notes"),
  backgroundColor: Colors.brown[300],
);

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(String title, String content) {
    _notes.add(Note(
      title: title,
      content: content,
    ));
    notifyListeners();
  }

  void updateNoteTitle(int index, String title) {
    _notes[index].title = title;
    notifyListeners();
  }

  void updateNoteContent(int index, String content) {
    _notes[index].content = content;
    notifyListeners();
  }

  void removeNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}

class Note {
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
  });
}

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notesProvider.notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      notesProvider.notes[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto', // Custom font for title
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditNotePage(
                            note: notesProvider.notes[index],
                            noteIndex: index,
                          ),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        notesProvider.removeNote(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _showAddNotePage(context);
              },
              child: const Text('Add Note'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddNotePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AddNoteScreen()), // Navigate to the add note screen
    );
  }
}

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Note'),
        backgroundColor: Colors.brown[400],
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  contentController.text.isNotEmpty) {
                notesProvider.addNote(
                    titleController.text, contentController.text);
                Navigator.of(context).pop(); // Navigate back to NotesPage
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNotePage extends StatelessWidget {
  final Note note;
  final int noteIndex;

  EditNotePage({required this.note, required this.noteIndex});

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);
    final TextEditingController titleController =
        TextEditingController(text: note.title);
    final TextEditingController contentController =
        TextEditingController(text: note.content);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Note'),
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              onChanged: (value) {
                notesProvider.updateNoteTitle(
                    noteIndex, value); // Update title in real-time
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                onChanged: (value) {
                  notesProvider.updateNoteContent(
                      noteIndex, value); // Update content in real-time
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
