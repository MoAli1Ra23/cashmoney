import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entity/wallate.dart';

abstract class WallateRepo {
  Future<Wallate> getWallate( );

  // // Future<int> del(Wallate wallate);
  //   @Deprecated("use getWallate  ")

  // Future<int> update(Wallate wallate);
  Future<int> addToWalate(double val);
  Future<Option<Failure>> decrWalate(double val);

  ///deprecated
  ///
  @Deprecated("use getWallate  ")
  Future<List<Wallate>> allWallates();
}
