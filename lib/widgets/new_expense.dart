import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});

 State<NewExpense> createState() {
    return _NewExpenseState();
  }
}
class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            label: Text("Title"),
          ),
          ),
              TextField(
                controller:_amountController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: "\$ ",
                  label: Text("Amount"),
                ),
              ),
          Row(children: [
            ElevatedButton(onPressed: (){
              print(_titleController.text);
              print(_amountController.text);
            }, child: Text("Save Expense"))
          ],)
        ]
    )
    );
  }
}