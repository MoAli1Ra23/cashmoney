import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../../wallate/domain/repo/wallate_repo.dart';
import '../../domain/entity/income.dart';
import '../../domain/entity/source.dart';
 import '../../domain/repo/income_abst_repo.dart';
import '../../domain/repo/source_repo.dart';

class CreateInCome with ChangeNotifier {
  double value = 0;
  String source = "";
  DateTime date = DateTime.now();
  String? isValueValid;
  String? isSourceValide;
  List<String> sources = [];
  bool isSourceNew = true;
  void setDate(DateTime dateTime){
    date=dateTime;
    notifyListeners();
    
  }
   void validateValue(String s) {
    double? x = double.tryParse(s);
    if (x == null) {
      isValueValid = "لابد ان يكون رقم";
    } else if (x <= 0) {
      isValueValid = 'قيمة موجبة فقط';
    } else {
      value = x;
      isValueValid = null;
    }
    notifyListeners();
  }

  Future<void> sourceChange(String value) async {
    await _filterSource(value);
    _validateSource(value);
    notifyListeners();
  }

  void _validateSource(String value) {
    if (value.length < 2) {
      isSourceValide = " لا بد ان يكون حرفين علي الاقل";
    } else {
      isSourceValide = null;
      source = value;
      isSourceNew = true;
    }
  }

  Future<void> _filterSource(String value) async {
    var x = await getIt.get<SourceRepo>().allsources();
    var d = x.map((e) => e.text).toList();
    sources = d.where((element) => element.contains(value)).toList();
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

    
    if (isSourceNew) await _insertSource();

      _insertIncome();
    await _updateWalate();
    reset();
    }
  }

  void _insertIncome() async {
     await getIt.get<IncomeAbstrctRepo>().insert(
        Income(date: DateTime.now(), id: 0, source: source, value: value));
  }

  Future<void> _insertSource() async {
    await getIt.get<SourceRepo>().insert(Source(id: 0, text: source));
  }

  Future<void> _updateWalate() async {
    await getIt.get<WallateRepo>().addToWalate(value);
  }

  void reset() {
    value = 0;
    source = "";
    date = DateTime.now();
    isValueValid = null;
    isSourceValide = null;
    sources = [];
    isSourceNew = true;
    notifyListeners();
  }
}
