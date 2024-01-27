   
import 'package:injectable/injectable.dart';

import '../../domain/repo/icome_repo.dart';
import '../../domain/entity/income.dart';
// @Injectable(as:IncomeabReo)
@Injectable(as:IncomeabReo)
@Environment("debug")
  class IncomeDReop extends IncomeabReo{
  @preResolve
  @override
  Future<List<Income>> allIncomes() {
    return Future(() => [
      Income(id: 0, value: 25, source: "احمد", date: DateTime.now()),
      Income(id: 0, value: 25, source: "احمد", date: DateTime.now()),
      Income(id: 0, value: 25, source: "احمد", date: DateTime.now()),
      Income(id: 0, value: 25, source: "احمد", date: DateTime.now()),
    ]);
  }
  @preResolve

  @override
  Future<int> del(Income income) {
    // TODO: implement del
    throw UnimplementedError();
  }
  @preResolve

  @override
  Future<int> insert(Income income) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  @preResolve

  @override
  Future<int> update(Income income) {
    // TODO: implement update
    throw UnimplementedError();
  }

}