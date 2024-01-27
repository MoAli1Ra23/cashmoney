import '../entity/income.dart';

abstract class IncomeAbstrctRepo {
  Future<int> insert(Income income);
  Future<int> del(Income income);
  Future<int> update(Income income);
  Future<List<Income>> allIncomes();
}
