   
import 'package:injectable/injectable.dart';

 import '../../domain/entity/income.dart';
import '../../domain/repo/income_abst_repo.dart';
// @Injectable(as:IncomeabReo)
@LazySingleton(as:IncomeAbstrctRepo,env:["debug"])
// @Environment("debug")
  class IncomeDReop extends IncomeAbstrctRepo{
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
     throw UnimplementedError();
  }
  @preResolve

  @override
  Future<int> insert(Income income) {
     throw UnimplementedError();
  }
  @preResolve

  @override
  Future<int> update(Income income) {
     throw UnimplementedError();
  }
  
  @override
  Future<int> deleteAll(List<int> ids) {
     throw UnimplementedError();
  }

}