
import 'package:flutter/material.dart';

import '../../../../expenses/UI/page/manage_expenses_page.dart';
import '../../../../incomes/UI/pages/mange_incomes_page.dart';
import '../../../../report/UI/page/generate_report_view.dart';
import 'custom_main_button.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomRowButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const ManageIcomesPage();
              }));
            },
            text: "الدخل",
          ),
          CustomRowButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GeneralReportView()));
            },
            text: "التقارير",
          ),
          CustomRowButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const ManageExpensesPage(),
              ));
            },
            text: "النفقات",
          ),
        ],
      ),
    );
  }
}
