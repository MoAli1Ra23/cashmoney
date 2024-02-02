 import 'package:injectable/injectable.dart';

import '../../domain/repo/expenses_title_abst_repo.dart';
import '../../domain/entity/expenses_title.dart';
@Injectable(as:ExpensesTitleAbstRepo)
@Environment('debug')
class ExpensesTitleDebugRepo extends ExpensesTitleAbstRepo {
  @override
  Future<List<ExpensesTitle>> alltitel() {
    return Future(
      () => <ExpensesTitle>[
        const ExpensesTitle(id: 0, text: 'fix'),
        const ExpensesTitle(id: 0, text: 'car'),
        const ExpensesTitle(id: 0, text: 'fan'),
      ],
    );
  }

  @override
  Future<int> del(ExpensesTitle title) {
    // TODO: implement del
    throw UnimplementedError();
  }

  @override
  Future<int> insertIfNotExit(ExpensesTitle title) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update(ExpensesTitle title) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
