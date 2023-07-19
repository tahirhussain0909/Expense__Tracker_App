import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum CategorY { work, leisure, travel, food }

const categoryIcons = {
  CategorY.food: Icons.lunch_dining,
  CategorY.leisure: Icons.movie,
  CategorY.travel: Icons.flight_takeoff,
  CategorY.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategorY category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.categorY,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpanses, this.categorY)
      : expenses = allExpanses
            .where(
              (expense) => expense.category == categorY,
            )
            .toList();

  final CategorY categorY;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
