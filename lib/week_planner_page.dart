import 'package:flutter/material.dart';
import 'task.dart';

class WeekPlannerPage extends StatefulWidget {
  const WeekPlannerPage({Key? key}) : super(key: key);

  @override
  _WeekPlannerPageState createState() => _WeekPlannerPageState();
}

class _WeekPlannerPageState extends State<WeekPlannerPage> {
  // Store tasks for each day
  final Map<DateTime, List<Task>> _tasks = {};

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final daysOfWeek = List.generate(7, (index) {
      // Normalize the date (remove time portion)
      return DateTime(currentDate.year, currentDate.month,
          currentDate.day + index - currentDate.weekday + 1);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Planner'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: daysOfWeek.length,
        itemBuilder: (context, index) {
          final date = daysOfWeek[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${date.day} ${_getMonthName(date.month)} ${date.year}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'To-Dos/Reminders:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTodoList(date),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _addTask(date),
                    child: const Text('Add Task'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Build the to-do list for each day
  Widget _buildTodoList(DateTime date) {
    final tasks = _tasks[date] ?? [];
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _editTask(date, index),
              ),
              Checkbox(
                value: task.isCompleted,
                onChanged: (value) {
                  setState(() {
                    task.isCompleted = value!;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteTask(date, index),
              ),
            ],
          ),
        );
      },
    );
  }

  // Add a task
  void _addTask(DateTime date) {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter task title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    final normalizedDate = DateTime(
                      date.year,
                      date.month,
                      date.day,
                    );

                    if (_tasks[normalizedDate] == null) {
                      _tasks[normalizedDate] = [];
                    }
                    _tasks[normalizedDate]!.add(Task(title: controller.text));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Edit a task
  void _editTask(DateTime date, int index) {
    final task = _tasks[date]![index];
    final controller = TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Edit task title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    task.title = controller.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // Delete a task
  void _deleteTask(DateTime date, int index) {
    setState(() {
      _tasks[date]!.removeAt(index);
    });
  }

  // Helper function to get month name
  String _getMonthName(int month) {
    const monthNames = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month];
  }
}
