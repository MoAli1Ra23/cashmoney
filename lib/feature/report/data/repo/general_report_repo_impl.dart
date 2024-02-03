import 'package:cashmoney/feature/expenses/domain/repo/expenese_abst_repo.dart';
import 'package:cashmoney/feature/incomes/domain/entity/income.dart';
import 'package:cashmoney/feature/incomes/domain/repo/income_abst_repo.dart';
import 'package:cashmoney/feature/report/domain/entity/day_repot.dart';
import 'package:cashmoney/feature/report/domain/entity/general_report.dart';
import 'package:cashmoney/injection.dart';

import '../../../expenses/domain/entity/expense.dart';
import '../../domain/repo/general_report_repo.dart';

/// goal generate DayReport object
/// and list <DayReport>
/// steps
/// 1  load  allIncomes and allIncomes
/// 2  calculate beignValue;
/// 3  generat report for eatch day
/// 4  generate   report object
///

class GeneralReportRepoImpl extends GeneralReportRepo {
  late List<Income> allIncomes;
  late List<Expense> allExpenses;
  Future<void> load() async {
    allIncomes = await getIt.get<IncomeAbstrctRepo>().allIncomes();
    allExpenses = await getIt.get<ExpenseAbstrctRepo>().allexpenses();
  }

  List<DayReport> days = [];
  @override
  Future<GeneralReport> generatReport(DateTime begin, DateTime end) async {
    await load();
    double totalexpenses = totalexpensesBerforDate(begin);
    double totalIncome = totalIncomeBerforDate(begin);

    generateDaysList(totalexpenses, totalIncome, begin, end);
    return GeneralReport(
        begin: begin,
        end: end,
        beginValue: days.first.beginValue,
        endValue: days.last.endValue,
        state: days.last.state,
        days: days);
  }

  void generateDaysList(
      double totalexpenses, double totalIncome, DateTime begin, DateTime end) {
    double firstVal = calculateBegeinEndValue(
        totalexpenses: totalexpenses, totalIncome: totalIncome);

    DateTime d = begin;
    do {
      d = d.add(const Duration(days: 1));
      createDays(firstVal, d);
      firstVal = days.last.endValue;
    } while (d == end);
  }

  ///
  void createDays(double startValu, DateTime dateTime) {
    double totalExpense = _calculatEcpenses(dateTime);
    double totalIncomes = _calculatIncomes(dateTime);

    var d = DayReport(
        beginValue: startValu,
        date: dateTime,
        endValue: calculateBegeinEndValue(
            totalexpenses: totalExpense, totalIncome: totalIncomes),
        state: "",
        totalExpense: totalExpense,
        totalIncomes: totalIncomes);
    days.add(d);
  }

  double calculateBegeinEndValue(
      {required double totalexpenses, required double totalIncome}) {
    return totalIncome - totalexpenses;
  }

  double _calculatIncomes(DateTime dateTime) {
    List<Income> incomes =
        allIncomes.where((element) => element.date == dateTime).toList();

    double d = 0;
    for (var element in incomes) {
      d += element.value;
    }
    return d;
  }

  double _calculatEcpenses(DateTime dateTime) {
    var expenses = allExpenses.where((element) => element.date == dateTime);

    double d = 0;
    for (var element in expenses) {
      d += element.value;
    }
    return d;
  }

  double totalexpensesBerforDate(DateTime date) {
    double d = 0;
    allExpenses.where((element) => date == element.date).forEach((element) {
      d += element.value;
    });
    return d;
  }

  double totalIncomeBerforDate(DateTime date) {
    double d = 0;
    allIncomes.where((element) => date == element.date).forEach((element) {
      d += element.value;
    });
    return d;
  }
}
