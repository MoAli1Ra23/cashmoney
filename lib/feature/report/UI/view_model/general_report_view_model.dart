import 'package:cashmoney/feature/report/domain/entity/general_report.dart';
import 'package:cashmoney/injection.dart';
import 'package:flutter/material.dart';

import '../../domain/repo/general_report_repo.dart';

class GeneralReportViewModel extends ChangeNotifier {
  bool isLoaded = false;
  late GeneralReport report;
  late DateTime? begin = DateTime.now();
  late DateTime? end = DateTime.now();
  String? validateBegin;
  String? validateEnd;

  void setBegin({DateTime? dateTime, String? text}) {
    if (text != null) validateBeginText(text);
    if (dateTime != null && validateBegin == null) begin = dateTime;
  }

  void validateBeginText(String text) {
    var v = validateDate(text);

    if (v == null) {
      begin == DateTime.parse(text);
    } else {
      validateBegin = v;

      notifyListeners();
    }
  }

  void validateEndText(String text) {
    var v = validateDate(text);

    if (v == null) {
      end == DateTime.parse(text);
    } else {
      validateEnd = v;

      notifyListeners();
    }
  }

  void setEnd({DateTime? dateTime, String? text}) {
    if (text != null) validateEndText(text);

    if (dateTime != null && validateEnd == null) end = dateTime;
  }

  Future<void> generateReport() async {
    GeneralReportRepo repo = getIt.get<GeneralReportRepo>();
    if (begin != null && end != null) {
      report = await repo.generatReport(begin!, end!);
      isLoaded = true;
      notifyListeners();
    }
  }

  String? validateDate(String dateTime) {
    var v = DateTime.tryParse(dateTime);
    if (v == null) {
      return "format error";
    }
    return null;
  }
}
