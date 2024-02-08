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
    for (var ee in list) {
      Income inc = incomes.where((element) => element.id == ee.id).first;

      var index = incomes.indexOf(inc);

      await delete(index);
    }
    notifyListeners();
  }

  Future<void> delete(int index) async {
    Income inc = incomes[index];
    IncomeAbstrctRepo repo = getIt.get<IncomeAbstrctRepo>();
    await repo.del(inc);
    _editWallate(inc);
    notifyListeners();
  }

  void _editWallate(Income inc) {
    var wallate = getIt.get<WallateRepo>();
    wallate.decrWalate(inc.value);
  }
}
