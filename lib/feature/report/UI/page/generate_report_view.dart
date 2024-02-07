import 'package:cashmoney/feature/report/UI/page/widgets/days_date_table.dart';
import 'package:cashmoney/feature/report/UI/page/widgets/select_dates.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(DateFormat('yyyy-MM-dd').format(value.begin!)),
                
                          Text(DateFormat('yyyy-MM-dd').format(value.end!)),
                
                        ],
                      ),
                      DaysDateTable(
                        days: value.report.days,
                      )
                    ],
                  ),
                ),
              );
            }
          }
        },
      )),
    );
  }
}
