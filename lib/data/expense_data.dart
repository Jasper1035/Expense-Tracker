import 'package:expense_tracker/models/expense_item.dart';

class ExpenseData {
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }

  void deleteExpnese(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }
}
