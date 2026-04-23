import 'package:flutter/material.dart';
import 'package:expensetrackerjerryk/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ), //Text box at the top of the col
            const SizedBox(
              height: 4,
            ), //a little space between first row of the col and the second
            Row(
              children: [
                //We need a bunch of things in this row of the col, so add a Row
                Text('\$${expense.amount.toStringAsFixed(2)}'), //amount first
                Spacer(), //spacer to push everything else over to the right
                Row(
                  children: [
                    //Cat and Date closely grouped, so another row in this row
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
