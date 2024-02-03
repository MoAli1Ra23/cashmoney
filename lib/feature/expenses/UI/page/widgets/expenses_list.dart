// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../incomes/UI/widget/multi_func_list.dart';
import '../../../domain/entity/expense.dart';
import '../../view_model/manage_expenses.dart';
import 'expences_list_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    Key? key,
    required this.expensesProvide,
    required this.height,
  }) : super(key: key);
  final ManageExpenses expensesProvide;
  final double height;

  @override
  Widget build(BuildContext context) {
    var expenses = expensesProvide.expenses;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MultiFuncList<Expense>(
          onDeleteAll:( delExpenses) => expensesProvide.deleteAll(delExpenses),
          height: height,
          items: expensesProvide.expenses,
          builder: (context, index) {
            return ExpencesListItem(
              expense: expenses[index],
            );
          },
        ));
  }
}
