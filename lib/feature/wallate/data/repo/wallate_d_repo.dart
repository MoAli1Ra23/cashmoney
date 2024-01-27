 import 'package:injectable/injectable.dart';
import '../../domain/entity/wallate.dart';

import '../../domain/repo/wallate_repo.dart';
@Injectable(as: WallateRepo)
@Environment('debug')
class WallateDRepo extends WallateRepo{
  @override
  Future<List<Wallate>> allWallates() {
    return Future(() => [  Wallate(id: 0, balance: 5000)]);
   }

  @override
  Future<int> del(Wallate wallate) {
    // TODO: implement del
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Wallate wallate) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<int> update(Wallate wallate) {
     throw UnimplementedError();
  }

}