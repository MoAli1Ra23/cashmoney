// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cashmoney/feature/expenses/domain/entity/expenses_title.dart';
import 'package:cashmoney/shared/styles/styles.dart';

import '../../../../../widgets/custom_text_field.dart';
import '../../view_model/expense_type_chose.dart';

class ExpnesesTypeChoser extends StatelessWidget {
  ExpnesesTypeChoser({
    Key? key,
    required this.onSelect,
  }) : super(key: key);
  final ktitle = GlobalKey();
  final tc = TextEditingController();
  final void Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseTypeChoser>(
      builder: (context, pr, child) {
        return Column(
          children: [
            CustomTextField(
              textKey: ktitle,
              controller: tc,
              keyboardType: TextInputType.text,
              hintText: "البند",
              onChanged: (value) {
                pr.validateTitle(value);
                if (pr.isTitleValid == null) {
                  onSelect(value);
                }
              },
              validator: (_) => pr.isTitleValid,
            ),
            if (pr.types.isNotEmpty)
              Container(
                constraints: const BoxConstraints(maxHeight: 160,minHeight: 0),
                height:pr.types.length*50,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: pr.types.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        pr.select();
                        tc.text=pr.types[index].text;
                        onSelect(pr.types[index].text);
                      },
                      child: ExpensesTitleRow(expensesTitle: pr.types[index])),
                ),
              )
          ],
        );
      },
    );
  }
}

class ExpensesTitleRow extends StatelessWidget {
  const ExpensesTitleRow({
    Key? key,
    required this.expensesTitle,
  }) : super(key: key);
  final ExpensesTitle expensesTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      padding: const EdgeInsets.symmetric( horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    
          expensesTitle.icon ?? const Icon(Icons.edit_rounded),
          Text(
            expensesTitle.text,
            style: Styles.textb18,
          )
        ],
      ),
    );
  }
}
