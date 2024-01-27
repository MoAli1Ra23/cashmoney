 
 
import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../../wallate/domain/repo/wallate_repo.dart';
import '../../domain/entity/expense.dart';
import '../../domain/entity/expenses_title.dart';
import '../../domain/repo/expenese_abst_repo.dart';
import '../../domain/repo/expenses_title_abst_repo.dart';

class CreateExpenses with ChangeNotifier {
  double value = 0;
  String? isValueValid; // for save erro masge if vlaue is not valide
  String title = "";
  String? isTitleValid; // for save erro masge if title is not valide
  String details = "";
  String? isDetailsValid; // for save erro masge if details is not valide
  bool isTitlenew = true;
  List<String> titles = [];
  String? note;
  String? masge;
  // validation and inputs
  void validateValue(String s) {
    // call when input date in UI
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

  void validateTitle(String input) {
    if (input.isEmpty) {
      isTitleValid = 'لا يمكن ان تكون المصورفات فارغة';
    } else if (input.length < 2) {
      isTitleValid = "قصيرة جدا";
    } else {
      isTitleValid = null;
      title = input;
    }
    notifyListeners();
  }

  void validateDetalils(String input) {
    if (input.isEmpty) {
      isDetailsValid = 'لا يمكن ان تكون البيان فارغة';
    } else if (input.length < 2) {
      isDetailsValid = "قصيرة جدا";
    } else {
      isDetailsValid = null;
      details = input;
    }
    notifyListeners();
  }

  Future<void> save() async {
   var w=  (await getIt.get<WallateRepo>().allWallates()).first;
    if (isDetailsValid == null &&
        isTitleValid == null &&
        isValueValid == null) {
          if(w.balance<value)
          {
masge="الرصيد غير كافي";

          }
          else
          {
            w.copyWith(balance: w.balance-value);
            await  getIt.get<WallateRepo>().update(w);
            await getIt.get<ExpenseAbstrctRepo>().insert(Expense(date: DateTime.now(), details: details,title: title,value: value, note: note ?? "لا ملاحظات",id:0));
            var s=( await getIt.get<ExpensesTitleAbstRepo>().alltitel()).where((e) => e.text==title).firstOrNull;
            if(s==null)
            {
               await getIt.get<ExpensesTitleAbstRepo>().insert(ExpensesTitle(id: 0, text: title));

            }
            masge="تم";
          }
         }
         notifyListeners();
  }
}
