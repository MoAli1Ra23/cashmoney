// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cashmoney/feature/expenses/domain/entity/expense.dart';
import 'package:cashmoney/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../incomes/UI/widget/multi_func_list.dart';
import '../view_model/manage_expenses.dart';
import 'create_epneses_page.dart';
class ManageExpensesPage extends StatelessWidget {
  const ManageExpensesPage({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<ManageExpenses>().getExpenses();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: const Text(
            "  النفقات",
            style: TextStyle(
              //style
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CreateExpensesPage()));
            },
            child: const Icon(Icons.add)),
        body: ExpenseList(
          expensesProvide: Provider.of<ManageExpenses>(context, listen: true),
        ),
      ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    Key? key,
    required this.expensesProvide,
  }) : super(key: key);
  final ManageExpenses expensesProvide;

  @override
  Widget build(BuildContext context) {
    var expenses = expensesProvide.expenses;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: MultiFuncList<Expense>(
          items: expensesProvide.expenses,
          builder: (context, index) {
            return ExpencesListItem(
              expense: expenses[index],
            );
          },
        ));
  }
}

class ExpencesListItem extends StatelessWidget {
  const ExpencesListItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
           borderRadius: BorderRadius.horizontal(
            left: Radius.circular(2),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          expense.title,
          style: Styles.textb20
        ),
        Text(
          expense.value.toString(),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          expense.details,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
