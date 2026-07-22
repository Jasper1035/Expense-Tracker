import 'package:expense_tracker/components/expense_summery.dart';
import 'package:expense_tracker/components/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newExpenseNameController = TextEditingController();
  final newExpenseDollarController = TextEditingController();
  final newExpenseCentController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add a new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpenseNameController,
              decoration: InputDecoration(hintText: 'Expense name'),
            ),
            // TextField(controller: newExpenseAmountController),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: newExpenseDollarController,
                    decoration: InputDecoration(hintText: 'Dollars'),

                    keyboardType: TextInputType.number,
                  ),
                ),

                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,

                    controller: newExpenseCentController,
                    decoration: InputDecoration(hintText: 'Cents'),
                  ),
                ),
              ],
            ),
          ],
        ),

        actions: [
          MaterialButton(onPressed: save, child: Text('save')),
          MaterialButton(onPressed: cancel, child: Text('Cancel')),
        ],
      ),
    );
  }

  void save() {
    String amount =
        '${newExpenseDollarController.text}.${newExpenseCentController.text}';

    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: amount,
      dateTime: DateTime.now(),
    );

    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);

    newExpenseNameController.clear();
    newExpenseDollarController.clear();
    newExpenseCentController.clear();
  }

  void cancel() {
    Navigator.pop(context);
    newExpenseDollarController.clear();
    newExpenseCentController.clear();
    newExpenseNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        // appBar: AppBar(title: Text('no')),
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.black,
          child: Icon(Icons.add, color: Colors.white),
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(top: 50),
          child: ListView(
            children: [
              ExpenseSummery(startOfWeek: value.startOfWeekDate()),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpenseTile(
                    name: value.getAllExpenseList()[index].name,
                    amount: value.getAllExpenseList()[index].amount,
                    dateTime: value.getAllExpenseList()[index].dateTime,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
