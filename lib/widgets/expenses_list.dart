import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          );
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
