import '../entity/wallate.dart';

abstract class WallateRepo {
  Future<Wallate> getWallate( );

  Future<int> del(Wallate wallate);
  Future<int> update(Wallate wallate);
  Future<int> addToWalate(double val);
  Future<int> decrWalate(double val);

  ///deprecated
  ///
  @Deprecated("use getWallate  ")
  Future<List<Wallate>> allWallates();
}
