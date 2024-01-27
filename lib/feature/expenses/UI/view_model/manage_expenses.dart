import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../domain/entity/expense.dart';
import '../../domain/repo/expenese_abst_repo.dart';

class ManageExpenses extends ChangeNotifier {
  List<Expense> expenses = [];
  Future<void> getExpenses() async {
    expenses = await getIt.get<ExpenseAbstrctRepo>().allexpenses();
    notifyListeners();
  }
}
