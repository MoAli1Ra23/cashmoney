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
        // appBar: AppBar(
        //   elevation: 5,
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        //   title: const Text(
        //     "  النفقات",
        //     style: TextStyle(
        //       //style
        //       fontWeight: FontWeight.bold,
        //       fontSize: 22,
        //     ),
        //   ),
        // ),

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
              expensesProvide:
                  Provider.of<ManageExpenses>(context, listen: true),
            ),
          ],
        ),
      ),
    );
  }
}
