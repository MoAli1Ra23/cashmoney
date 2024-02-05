

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../view_model/general_report_view_model.dart';

class SelectDates extends StatefulWidget {
  const SelectDates({
    Key? key,
    required this.vm,
  }) : super(key: key);
  final GeneralReportViewModel vm;

  @override
  State<SelectDates> createState() => _SelectDatesState();
}

class _SelectDatesState extends State<SelectDates> {
  TextEditingController begin = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  TextEditingController end = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  Future<void> _setBegin() async {
    var x = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        2020,
      ),
      lastDate: DateTime.now(),
    );
    if (x != null) {
      widget.vm.setBegin(dateTime: x);
      begin.text = DateFormat('yyyy-MM-dd').format(x);
    }
  }

  Future<void> _setEnd() async {
    var x = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        2020,
      ),
      lastDate: DateTime.now(),
    );
    if (x != null) {
      widget.vm.setEnd(dateTime: x);
      end.text = DateFormat('yyyy-MM-dd').format(x);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (v) => widget.vm.setBegin(text: v),
            validator: (_) => widget.vm.validateBegin,
            controller: begin,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                suffix: IconButton(
                  icon: const Icon(Icons.calendar_month_outlined),
                  onPressed: () {
                    _setBegin();
                  },
                )),
          ),
          TextFormField(
            onChanged: null,

            /// (v) => widget.vm.setEnd(text: v),
            validator: (_) => widget.vm.validateEnd,
            controller: end,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                suffix: IconButton(
                  icon: const Icon(Icons.calendar_month_outlined),
                  onPressed: () {
                    _setEnd();
                  },
                )),
          ),
          ElevatedButton(
              onPressed: () {
                widget.vm.generateReport();
              },
              child: const Text("save"))
        ],
      ),
    );
  }
}
