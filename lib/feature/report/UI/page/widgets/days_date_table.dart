import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/styles/styles.dart';
import '../../../domain/entity/day_repot.dart';

class DaysDateTable extends StatelessWidget {
  const DaysDateTable({
    Key? key,
    required this.days,
  }) : super(key: key);
  final List<DayReport> days;
   @override
  Widget build(BuildContext context) {
     
    List<TableRow> rows = [];
   var r= TableRow( decoration: const BoxDecoration(
               color: Colors.blueGrey,
               borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:  Radius.circular(10) ,)

   ),
    children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * .18,
           child: const Text("القيمة النهائية",
              style: Styles.textb20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis)),
       
      SizedBox(
          width: MediaQuery.of(context).size.width * .18,
           child: const Text("اجمالي الدخل",
              style: Styles.textb20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis)),
      SizedBox(
          width: MediaQuery.of(context).size.width * .18,
           child: const Text("اجمالي المصروفات",
              style: Styles.textb20,
              maxLines: 2,
              overflow: TextOverflow.ellipsis)),
      SizedBox(
          width: MediaQuery.of(context).size.width * .18,
           child: const Text(
            "القيمة المستلمة",
            style: Styles.textb20,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          
           SizedBox(
        width: MediaQuery.of(context).size.width * .18,
         child: const Text("التاريخ",
            style: Styles.textb20,
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
      )
    ]);
    rows.add(r);

    for (var element in days) {
  var s=    TableRow(children: [
        Text(
          DateFormat("yy-mm-dd"). format(element.date),
          style: Styles.textb18.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          element.beginValue.toString(),
          style: Styles.textb18.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          element.totalExpense.toString(),
          style: Styles.textb18.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          element.totalIncomes.toString(),
          style: Styles.textb18.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          element.endValue.toString(),
          style: Styles.textb18.copyWith(fontWeight: FontWeight.w600),
        ),
        
      ]);
      rows.add(s);
    }
    return Table(children: rows,
    border: TableBorder.all(color: Colors.black,borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))) ,);
  }
}
