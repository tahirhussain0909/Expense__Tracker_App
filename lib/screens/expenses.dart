import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/screens/new_expense.dart';
import 'package:expense_tracker_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 2.00,
      date: DateTime.now(),
      category: CategorY.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 20.00,
      date: DateTime.now(),
      category: CategorY.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Expense Tracker',
          ),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay,
                icon: const Icon(
                  Icons.add,
                ))
          ]),
      body: Column(
        children: [
          const Text(
            'The Chart',
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
