import 'package:flutter/material.dart';

import '../../../../../shared/styles/styles.dart';
import '../../../domain/entity/expense.dart';

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
        Text(expense.title, style: Styles.textb20),
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
