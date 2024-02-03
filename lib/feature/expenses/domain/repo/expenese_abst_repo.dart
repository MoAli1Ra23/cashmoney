import '../entity/expense.dart';

abstract class ExpenseAbstrctRepo {
  Future<int> insert(Expense expense);
  Future<int> del(Expense expense);
  Future<void> deleteAll(List<Expense> expenses);
  Future<int> update(Expense expense);
  Future<List<Expense>> allexpenses();
}
