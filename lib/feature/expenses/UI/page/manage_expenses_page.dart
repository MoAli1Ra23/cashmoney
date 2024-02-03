import 'package:cashmoney/widgets/cutom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/styles/styles.dart';
import '../view_model/manage_expenses.dart';
import 'create_epneses_page.dart';
import 'widgets/expenses_list.dart';

class ManageExpensesPage extends StatelessWidget {
  const ManageExpensesPage({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<ManageExpenses>().getExpenses();
    return SafeArea(
      child: Scaffold(
         

        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CreateExpensesPage()));
            },
            child: const Icon(Icons.add)),
        body: Column(
          children: [
            const CustomAppBar(
              rightIcon: Icon(Icons.arrow_back_ios_new_rounded),
              title: Text(
                "النفقات",
                style: Styles.textb30,
              ),
              liftIcon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            ExpenseList(
              height: MediaQuery.of(context).size.height-200,
              expensesProvide:
                  Provider.of<ManageExpenses>(context, listen: true),
            ),
          ],
        ),
      ),
    );
  }
}
