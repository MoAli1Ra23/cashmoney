import 'package:cashmoney/feature/wallate/domain/repo/wallate_repo.dart';
import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../domain/entity/expense.dart';
import '../../domain/repo/expenese_abst_repo.dart';

class ManageExpenses extends ChangeNotifier {
  List<Expense> expenses = [];
  bool loaded = false;
  Future<void> getExpenses() async {
    
      expenses = [];
      expenses = await getIt.get<ExpenseAbstrctRepo>().allexpenses();
      loaded = true;
      notifyListeners();
 
     
  }

  Future<void> deleteAll(List<Expense> expense) async {
    double value = 0;

    for (var element in expense) {
      value += element.value;
    }

    await getIt.get<ExpenseAbstrctRepo>().deleteAll(expense);

    await getIt.get<WallateRepo>().addToWalate(value);
    await getExpenses();
  }
}
