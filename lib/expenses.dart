import 'package:expensetrackerjerryk/expenses_list.dart';
import 'package:expensetrackerjerryk/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(title: "Mixue", 
    amount: 25.00, 
    date: DateTime.now(), 
    category: Category.food
    ),

    Expense(title: "Plane ticket to Moldova", 
    amount: 15.25, 
    date: DateTime.now(), 
    category: Category.travel
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("CHART GOES HERE"),
          SizedBox(height:30),
          ExpensesList(expenses: _registeredExpenses),
        ],
    ),
    );
  }

}