 
 
 
import 'package:flutter/foundation.dart';

import '../../../../injection.dart';
import '../../domain/entity/income.dart';
 

import '../../domain/repo/icome_repo.dart'; // Import the provider package


class ManageIcomes with ChangeNotifier {
  List<Income> _incomes = [];
  int value = 0;
  List<Income> get incomes => _incomes;

  String source = '';
  Future<void> income() async {
    var x = getIt.get<IncomeabReo>();
    _incomes = await x.allIncomes();
    notifyListeners();
  }
}
