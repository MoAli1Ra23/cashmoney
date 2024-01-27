 
import 'package:injectable/injectable.dart';

import '../../../../injection.dart';
import '../../../../shared/data/app_db.dart';
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
  Future<int> insert(Wallate wallate) {
    var x = getIt.get<AppDb>();

    return x.insert(''' 
INSERT INTO wallate(balance)VALUES(${wallate.balance})
''');
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
}
