import 'package:flutter/foundation.dart';

import '../../../../injection.dart';
import '../../domain/entity/income.dart';

import '../../domain/repo/icome_repo.dart'; // Import the provider package

class ManageIcomes with ChangeNotifier {
  List<Income> _incomes = [];
  int value = 0;
  List<Income> get incomes => _incomes;
  bool loading = true;

  String source = '';
  Future<void> income() async {
    var x = getIt.get<IncomeabReo>();
    _incomes = await x.allIncomes();
    loading = false;
    notifyListeners();
  }

  Future<void> deleteAll(List<Income> list) async {
    for (var element in list) {
      await delete(incomes.indexOf(element));
      incomes.remove(element);
    }
    notifyListeners();
  }

  Future<void> delete(int index) async {
    Income inc = incomes[index];
    incomes.removeAt(index);
    IncomeabReo repo = getIt.get<IncomeabReo>();
    repo.del(inc);
    notifyListeners();
  }
}
