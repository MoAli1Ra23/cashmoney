 
import 'package:flutter/foundation.dart';

import '../../../injection.dart';
import '../domain/entity/wallate.dart';
import '../domain/repo/wallate_repo.dart';

class WallateViewModel extends ChangeNotifier{

    String text="0";

Future<void> getValue()
async {
  var x=  getIt.get<WallateRepo>();
  var l= await x.allWallates();
  Wallate? f=l.firstOrNull;
  if(f==null)
  {

f=  Wallate(id: 0, balance: 0);
x.insert(f);
  }
  text= f.balance.toString();
  notifyListeners();
  
}




} 