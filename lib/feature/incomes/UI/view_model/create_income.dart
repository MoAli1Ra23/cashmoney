import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../../wallate/domain/repo/wallate_repo.dart';
import '../../domain/entity/income.dart';
import '../../domain/entity/source.dart';
import '../../domain/repo/icome_repo.dart';
import '../../domain/repo/source_repo.dart';

class CreateInCome with ChangeNotifier {
  double value = 0;
  String source = "";
  DateTime date = DateTime.now();
  String? isValueValid;
  String? isSourceValide;
  List<String> sources = [];
  bool isSourceNew = true;
  void validateValue(String s) {
    double? x = double.tryParse(s);
    if (x == null) {
      isValueValid = "not num";
    } else if (x <= 0) {
      isValueValid = 'naigativ';
    } else {
      value = x;
      isValueValid = null;
    }
    notifyListeners();
    print("/++++++++++++++++/");
    print(value);
    print(isValueValid);
  }

  Future<void> validateSource(String value) async {
    var x = await getIt.get<SourceRepo>().allsources();
    var d = x.map((e) => e.text).toList();
    sources = d.where((element) => element.contains(value)).toList();
    if (value.length < 2) {
      isSourceValide = "Soo short";
    } else {
      isSourceValide = null;
      source = value;
      isSourceNew = true;
    }
    notifyListeners();
  }

  void selctSourc(int index) {
    source = sources[index];
    isSourceNew = false;
    isSourceValide = null;
    sources = [];
    notifyListeners();
  }

  Future<void> save() async {
    if (isSourceValide == null && isValueValid == null) {
      print("sourc: $source");
      print("value: $value");
    }
    if (isSourceNew) {
      await getIt.get<SourceRepo>().insert(Source(id: 0, text: source));
    }
    await getIt.get<IncomeabReo>().insert(
        Income(date: DateTime.now(), id: 0, source: source, value: value));
    var w = (await getIt.get<WallateRepo>().allWallates()).first;
    var neww = w.copyWith(balance: w.balance + value);

    await getIt.get<WallateRepo>().update(neww);
  }
}
