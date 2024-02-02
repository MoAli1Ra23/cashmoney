import 'package:flutter/foundation.dart';

import '../../../injection.dart';
import '../domain/entity/wallate.dart';
import '../domain/repo/wallate_repo.dart';

class WallateViewModel extends ChangeNotifier {
  String text = "0";

  Future<void> getValue() async {
    WallateRepo wallateRepo = getIt.get<WallateRepo>();

    Wallate w = await wallateRepo.getWallate();

    text = w.balance.toString();
    notifyListeners();
  }
}
