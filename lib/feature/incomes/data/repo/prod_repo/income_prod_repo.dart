import 'package:injectable/injectable.dart';
import '../../../../../injection.dart';
import '../../../../../shared/data/app_db.dart';
import '../../../domain/entity/income.dart';
import '../../../domain/repo/income_abst_repo.dart';

// Injectable IncomeabReo
@LazySingleton(as: IncomeAbstrctRepo, env: ['prod'])
// @Singleton(as:IncomeabReo,env: ["prod"])
// @Environment('prod')
class IncomeReo extends IncomeAbstrctRepo {
  @override
  Future<List<Income>> allIncomes() async {
    var x = getIt.get<AppDb>();
    var l = await x.readdate(''' 
     SELECT *FROM "incomes"
    ''');
    return l.map((e) => Income.fromMap(e)).toList();
  }

  @override
  Future<int> del(Income income) async {
    AppDb appDb = getIt.get<AppDb>();
    int re =
        await appDb.detletitem('DELETE FROM incomes WHERE id = ${income.id}');
    return re;
  }

  @override
  Future<int> insert(Income income) async {
    var x = getIt.get<AppDb>();
    return await x.insert('''  
       INSERT INTO Incomes(value, source, date)VALUES (${income.value},"${income.source}", ${income.date.millisecondsSinceEpoch})
       ''');
  }

  @override
  Future<int> deleteAll(List<int> ids) async {
    // int count = await db.delete(tableTodo, where: 'columnId = ?', whereArgs: [id]);
    AppDb appDb = getIt.get<AppDb>();
    for (var id in ids) {
      
      await appDb.detletitem('DELETE FROM incomes WHERE id = ${id}');
    }

    return 1;
  }

  @override
  Future<int> update(Income income) {
    throw UnimplementedError();
  }
}
