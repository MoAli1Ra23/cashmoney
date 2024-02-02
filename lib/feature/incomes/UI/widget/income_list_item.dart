import 'package:flutter/material.dart';

import '../../../../shared/styles/styles.dart';
import '../../domain/entity/income.dart';
class IncomeListItem extends StatelessWidget {
  const IncomeListItem({super.key, required this.income});
final Income income;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
      Text(income.source,style: Styles.textb18,),
      const SizedBox(width: 20,),
      Text(income.value.toString(), style: Styles.textbI18.copyWith(color: Colors.red),)
    ],);
   }
  
}