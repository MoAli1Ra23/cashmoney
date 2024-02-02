import 'package:dartz/dartz.dart';
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
    if (isDetailsValid == null &&
        isTitleValid == null &&
        isValueValid == null) {
      WallateRepo repo = getIt.get<WallateRepo>();

      Option r = await repo.decrWalate(value);
      if (r.isNone()) {
        await _insertExpenses();
        masge = " تم الاضافة";
      }

      insertExpensesTitle();
    } else {
      masge = "الرصيد لا يكفي";
    }
    notifyListeners();
  }

  void insertExpensesTitle() async {
    await getIt
        .get<ExpensesTitleAbstRepo>()
        .insertIfNotExit(ExpensesTitle(id: 0, text: title));
  }

  Future<void> _insertExpenses() async {
    await getIt.get<ExpenseAbstrctRepo>().insert(Expense(
        date: DateTime.now(),
        details: details,
        title: title,
        value: value,
        note: note ?? "لا ملاحظات",
        id: 0));
  }
}
