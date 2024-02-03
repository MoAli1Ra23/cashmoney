import '../entity/general_report.dart';

abstract class GeneralReportRepo {
  Future<GeneralReport> generatReport(DateTime begin,DateTime end);
  
  
}