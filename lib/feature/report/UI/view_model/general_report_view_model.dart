import 'package:cashmoney/feature/report/domain/entity/general_report.dart';
import 'package:cashmoney/injection.dart';
import 'package:flutter/material.dart';

import '../../data/repo/general_report_repo_impl.dart';

class GeneralReportViewModel extends ChangeNotifier {
  bool isLoaded = false;
  late GeneralReport report;
  late DateTime? begin;
  late DateTime? end;
   void setBegin(DateTime dateTime)
   {
    begin=dateTime;

   }
   void setEnd(DateTime dateTime)
   {
    end=dateTime;

   }
  Future<void> generateReport() async {
    GeneralReportRepoImpl repo = getIt.get<GeneralReportRepoImpl>();
    if (begin != null && end != null) {
    report= await  repo.generatReport(begin!, end!);
    isLoaded=true;
    notifyListeners();
    }
  }
}
