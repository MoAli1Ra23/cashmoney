import 'package:injectable/injectable.dart';

import '../../domain/repo/expenese_abst_repo.dart';
import '../../domain/entity/expense.dart';

@LazySingleton(as: ExpenseAbstrctRepo)
@Environment("debug")
// @Singleton(as: ExpenseAbstrctRepo)

class ExpenseDebugeRepo extends ExpenseAbstrctRepo {
  @preResolve
  @override
  Future<List<Expense>> allexpenses() {
    return Future(() => [
          Expense(
            id: 0,
            value: 25,
            title: "title",
            details: "details",
            note: "note",
            date: DateTime.now(),
          ),
          Expense(
            id: 0,
            value: 25,
            title: "title",
            details: "details",
            note: "note",
            date: DateTime.now(),
          ),
          Expense(
            id: 0,
            value: 25,
            title: "title",
            details: "details",
            note: "note",
            date: DateTime.now(),
          ),
          Expense(
            id: 0,
            value: 25,
            title: "title",
            details: "details",
            note: "note",
            date: DateTime.now(),
          ),
        ]);
  }

  @preResolve
  @override
  Future<int> del(Expense expense) {
    throw UnimplementedError();
  }

  @preResolve
  @override
  Future<int> insert(Expense expense) {
    throw UnimplementedError();
  }

  @preResolve
  @override
  Future<int> update(Expense expense) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteAll(List<Expense> expenses) {
     throw UnimplementedError();
  }
}
