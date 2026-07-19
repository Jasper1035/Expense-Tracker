import 'package:expense_tracker/bar_graph/graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummery extends StatelessWidget {
  const ExpenseSummery({super.key, required DateTime startOfWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: Graph(
          maxY: 100,
          sunAmount: 20,
          monAmount: 50,
          tueAmount: 10,
          wedAmount: 30,
          thurAmount: 25,
          friAmount: 24,
          satAmount: 90,
        ),
      ),
    );
  }
}
