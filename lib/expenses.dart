import 'package:expensetrackerjerryk/widgets/chart/chart.dart';
import 'package:expensetrackerjerryk/widgets/expenses_list/expenses_list.dart';
import 'package:expensetrackerjerryk/widgets/expenses_list/expense_item.dart';
import 'package:expensetrackerjerryk/models/expense.dart';
import 'package:expensetrackerjerryk/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Expense deleted!"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Mixue",
      amount: 25.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Train ticket to Orlando, FL",
      amount: 15.25,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "Ticket to the NYIT movie",
      amount: 6.70,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // print("Width: ${MediaQuery.of(context).size.width}");
    // print("Height: ${MediaQuery.of(context).size.height}");
    Widget mainContent = const Center(
      child: Text("No expenses found. Click + to add one."),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        tooltip: 'Add Expense',
        child: const Icon(Icons.add),
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
