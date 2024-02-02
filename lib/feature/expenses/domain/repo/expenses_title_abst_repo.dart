 
import '../entity/expenses_title.dart';

abstract class ExpensesTitleAbstRepo {
  Future<int> insertIfNotExit(ExpensesTitle title);
  Future<int> del(ExpensesTitle title);
  Future<int> update(ExpensesTitle title);
  Future<List<ExpensesTitle>> alltitel();

}