import 'package:cashmoney/feature/expenses/domain/entity/expense.dart';
import 'package:cashmoney/injection.dart';
import 'package:cashmoney/shared/data/app_db.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repo/expenese_abst_repo.dart';

@Injectable(as: ExpenseAbstrctRepo)
// @Singleton(as: ExpenseAbstrctRepo)
@Environment("prod")
class ExpenseDebugeRepo extends ExpenseAbstrctRepo {
  @preResolve
  @override
  Future<List<Expense>> allexpenses() async {
    var x = await getIt.get<AppDb>().readdate(" SELECT *FROM  'expense'");
    return x.map((e) => Expense.fromMap(e)).toList();
  }

  @preResolve
  @override
  Future<int> del(Expense expense) {
    throw UnimplementedError();
  }

  @preResolve
  @override
  Future<int> insert(Expense expense) async {
    var x = getIt.get<AppDb>();
    return await x
        .insert(''' 
        INSERT INTO expense( value,title,details,note,date)VALUES 
    (${expense.value},"${expense.details}","${expense.title}","${expense.note}",${expense.date.microsecondsSinceEpoch})
    ''');
  }

  @preResolve
  @override
  Future<int> update(Expense expense) {
    throw UnimplementedError();
  }
}
