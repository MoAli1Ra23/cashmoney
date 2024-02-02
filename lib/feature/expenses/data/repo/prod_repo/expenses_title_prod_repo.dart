import 'package:cashmoney/feature/expenses/domain/entity/expenses_title.dart';
import 'package:cashmoney/injection.dart';
import 'package:cashmoney/shared/data/app_db.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repo/expenses_title_abst_repo.dart';

@Injectable(as: ExpensesTitleAbstRepo)
@Environment('prod')
class ExpensesTitleProdRepo extends ExpensesTitleAbstRepo {
  @override
  Future<List<ExpensesTitle>> alltitel() async {
    var x = getIt.get<AppDb>();
    var l = await x.readdate(" SELECT *FROM 'expensesTitle'");
    return l
        .map(
          (e) => ExpensesTitle.fromMap(e),
        )
        .toList();
  }

  @override
  Future<int> del(ExpensesTitle title) {
    throw UnimplementedError();
  }

  @override
  Future<int> insertIfNotExit(ExpensesTitle title) async {
    AppDb appDb = getIt.get<AppDb>();
    ExpensesTitle? s = (await alltitel()).firstOrNull;
    if (s == null) {
      return await appDb.insert(''' 
INSERT INTO  expensesTitle(text)VALUES("${title.text}")
''');
    } else {
      return 0;
    }
  }

  @override
  Future<int> update(ExpensesTitle title) {
    throw UnimplementedError();
  }
}
