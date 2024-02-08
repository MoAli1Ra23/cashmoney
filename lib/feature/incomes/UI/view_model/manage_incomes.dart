import 'dart:math';

import 'package:flutter/foundation.dart';

import '../../../../injection.dart';
import '../../../wallate/domain/repo/wallate_repo.dart';
import '../../domain/entity/income.dart';
import '../../domain/repo/income_abst_repo.dart';

class ManageIcomes with ChangeNotifier {
  List<Income> _incomes = [];
  int value = 0;
  List<Income> get incomes => _incomes;
  bool loading = true;

  String source = '';
  Future<void> income() async {
    var x = getIt.get<IncomeAbstrctRepo>();
    _incomes = await x.allIncomes();
    loading = false;
    notifyListeners();
  }

  Future<void> deleteAll(List<Income> list) async {
    loading = true;
    List<int> indexs = [];
    double value = 0;
    notifyListeners();
    for (var ee in list) {
      Income inc = incomes.where((element) => element.id == ee.id).first;
      indexs.add(inc.id);
      value += inc.value;
      print(indexs);
    }
    IncomeAbstrctRepo repo = getIt.get<IncomeAbstrctRepo>();
    await repo.deleteAll(indexs);
    _editWallate(value);
    await income();

    loading = false;
    notifyListeners();
  }

  Future<void> delete({int? index, Income? incs}) async {
    Income? inc = incs;
    print(index);
    if (inc == null && index != null) {
      inc = incomes[index];
    } else if (inc == null && index == null) {
      return;
    }

    IncomeAbstrctRepo repo = getIt.get<IncomeAbstrctRepo>();
    await repo.del(inc!);
    _editWallate(inc.value);
    notifyListeners();
  }

  void _editWallate(double value) {
    var wallate = getIt.get<WallateRepo>();
    wallate.decrWalate(value);
  }
}
