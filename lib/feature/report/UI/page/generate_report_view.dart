import 'package:cashmoney/feature/report/UI/page/widgets/days_date_table.dart';
import 'package:cashmoney/feature/report/UI/page/widgets/select_dates.dart';
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/general_report_view_model.dart';
class GeneralReportView extends StatelessWidget {
  const GeneralReportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<GeneralReportViewModel>(
        builder: (context, value, child) {
          {
            if (!value.isLoaded) {
              return SelectDates(
                vm: value,
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DaysDateTable(days: value.report.days,),
                  )
                ],
              );
            }
          }
        },
      )),
    );
  }
}
