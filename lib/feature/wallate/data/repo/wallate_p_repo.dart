import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../injection.dart';
import '../../../../shared/data/app_db.dart';
import '../../../../shared/error/failure.dart';
import '../../domain/entity/wallate.dart';
import '../../domain/repo/wallate_repo.dart';

@Injectable(as: WallateRepo)
@Environment('prod')
class WallatePRepo extends WallateRepo {
  @override
  Future<List<Wallate>> allWallates() async {
    var x = getIt.get<AppDb>();
    var l = await x.readdate(" SELECT *FROM 'wallate'");
    return l.map((e) => Wallate.fromMap(e)).toList();
  }

  @override
  Future<int> del(Wallate wallate) {
    throw UnimplementedError();
  }

  @override
  Future<Wallate> getWallate() async {
    var appDb = getIt.get<AppDb>();

    Wallate? w = await _getWallateOrNull(appDb);
    if (w != null) return w;

    Wallate wallate = const Wallate(id: 1, balance: 0);

    await _insertWallate(appDb, wallate);

    return wallate;
  }

  Future<void> _insertWallate(AppDb appDb, Wallate wallate) async {
    await appDb.insert(''' 
INSERT INTO wallate(balance)VALUES(${wallate.balance})
    ''');
  }

  Future<Wallate?> _getWallateOrNull(AppDb appDb) async {
    var l = await appDb.readdate(" SELECT *FROM 'wallate'");

    Wallate? w = l.map((e) => Wallate.fromMap(e)).toList().firstOrNull;
    return w;
  }

  @override
  Future<int> update(Wallate wallate) async {
    var x = getIt.get<AppDb>();
    return await x.updateitem(''' 
  UPDATE  wallate set
 balance = "${wallate.balance}"
  
WHERE id=${1}
    ''');
  }

  @override
  Future<int> addToWalate(double val) async {
    Wallate wallate = await getWallate();
    var updatedWallate = wallate.copyWith(balance: wallate.balance + val);
    var f = await update(updatedWallate);
    return f;
  }

  @override
  Future<Option<Failure>> decrWalate(double val) async {
    Wallate wallate = await getWallate();
    if (wallate.balance < val) {
      return const Some(LowWallateBalanceFailure(msg: "رصيد غير كافي"));
    }

    var updatedWallate = wallate.copyWith(balance: wallate.balance + val);
    await update(updatedWallate);
    return none();
  }
}
