 
 import 'package:injectable/injectable.dart';

import '../../../../../injection.dart';
import '../../../../../shared/data/app_db.dart';
import '../../../domain/entity/income.dart';
import '../../../domain/repo/icome_repo.dart';

 
// Injectable IncomeabReo
@Injectable(as: IncomeabReo)
// @Singleton(as:IncomeabReo,env: ["prod"])
@Environment("prod")
class IncomeReo extends IncomeabReo {
  @override
  Future<List<Income>> allIncomes() async {
    var x= getIt.get<AppDb>();
    var l= await x.readdate(''' 
     SELECT *FROM "incomes"
    ''');
    return l.map((e) => Income.fromMap(e)).toList();
  }

  @override
  Future<int> del(Income income) {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Income income) async {
       var x= getIt.get<AppDb>();
       return await x.insert('''  
       INSERT INTO Incomes(value, source, date)VALUES (${income.value},"${income.source}", ${income.date.millisecondsSinceEpoch})
       ''');
   }

  @override
  Future<int> update(Income income) {
    throw UnimplementedError();
  }
}
