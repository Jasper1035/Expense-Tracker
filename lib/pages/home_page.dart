import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add a new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: newExpenseNameController),
            TextField(controller: newExpenseAmountController),
          ],
        ),

        actions: [
          MaterialButton(onPressed: save, child: Text('save')),
          MaterialButton(onPressed: cancel, child: Text('Cancel')),
        ],
      ),
    );
  }

  void save() {}

  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: Icon(Icons.add),
      ),
    );
  }
}
