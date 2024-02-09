import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/styles/styles.dart';
import '../../../../widgets/custom_reusable_app_bar.dart';
import '../../../home/UI/view/widgets/wallate_balance.dart';
import '../view_model/manage_expenses.dart';
import 'create_epneses_page.dart';
import 'widgets/expenses_list.dart';

class ManageExpensesPage extends StatelessWidget {
  const ManageExpensesPage({super.key});
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 10),
              child: CustomReusableAppBar(
                title: "النفقات",
                titleStyle: Styles.textb30,
                leftIcon: const Icon(Icons.arrow_back_ios_new_rounded),
                righeIcon: const Icon(Icons.add_rounded),
                onLeftTab: () => Navigator.of(context).pop(),
                onRightTab: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CreateExpensesPage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Hero(tag: "mony", child: WallateBalance()),
            const SizedBox(
              height: 50,
            ),
            Consumer<ManageExpenses>(
              builder: (_, value, child) {
                return value.loaded
                    ? ExpenseList(
                        height: MediaQuery.of(context).size.height -250,
                        expensesProvide: value,
                      )
                    : const Center(
                        child: Text("No Expenses"),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
