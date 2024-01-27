 
 
import '../entity/wallate.dart';

abstract class WallateRepo{
  Future<int> insert(Wallate wallate);
  Future<int> del(Wallate wallate);
  Future<int> update(Wallate wallate);
  Future<List<Wallate>> allWallates();
}