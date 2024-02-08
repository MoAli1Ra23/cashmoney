import 'package:cashmoney/feature/expenses/domain/entity/expenses_title.dart';
import 'package:cashmoney/injection.dart';
import 'package:flutter/material.dart';

import '../../domain/repo/expenses_title_abst_repo.dart';

class ExpenseTypeChoser extends ChangeNotifier {
  List<ExpensesTitle> types = [];
  String? isTitleValid;
  Future<void> load(String vale) async {
    ExpensesTitleAbstRepo repo = getIt.get<ExpensesTitleAbstRepo>();
    var s = await repo.alltitel();
    types = s.where((element) => element.text.contains(vale)).toList();
    notifyListeners();
  }

  void validateTitle(String? value) {
    if (isSelected && types.isEmpty) {
      return;
    }
    isSelected = false;
    if (value == null || value.length < 2) {
      isTitleValid = "لا بد ان يكون اكثر من حرفين";
      notifyListeners();
    }
    {
      load(value!);
    }
  }

  bool isSelected = false;

  void select() {
    types.clear();
    isSelected = true;
    notifyListeners();
  }
}
