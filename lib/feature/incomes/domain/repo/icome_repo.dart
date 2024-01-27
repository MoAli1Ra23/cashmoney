import '../entity/income.dart';

abstract class IncomeabReo{
   Future<int> insert(Income income);
  Future<int> del(Income income);
  Future<int> update(Income income);
  Future<List<Income>> allIncomes();
}