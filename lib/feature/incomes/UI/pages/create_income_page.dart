import 'dart:ui';

import 'package:cashmoney/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart' as date;
import '../../../../shared/styles/styles.dart';
import '../../../../widgets/custom_reusable_app_bar.dart';
import '../view_model/create_income.dart';

class CreateInComePage extends StatelessWidget {
  CreateInComePage({super.key});
  final GlobalKey k = GlobalKey<FormState>();
  final tc = TextEditingController();
  final stc = TextEditingController();
  // key:vkey ,
  final GlobalKey vkey = GlobalKey();
  final GlobalKey skey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // appBar: AppBar(
      //   elevation: 5,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //         context.read<WallateViewModel>().getValue();
      //       },
      //       icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      //   title: const Text(
      //     "اضافة دخل",
      //     style: TextStyle(
      //       //style
      //       fontWeight: FontWeight.bold,
      //       fontSize: 22,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 40),
            child: CustomReusableAppBar(
              title: "إضافة دخل",
              titleStyle: Styles.textb30,
              onLeftTab: () => Navigator.of(context).pop(),
              leftIcon: const Icon(Icons.arrow_back_ios_new_rounded),
              righeIcon: const Icon(Icons.menu),
            ),
          ),
          Form(
            key: k,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CreateInCome>(
                builder: (context, pr, _) => SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      CustomTextField(
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        textKey: vkey,
                        hintText: "القيمة",
                        
                        controller: tc,
                        onChanged: (v) => pr.validateValue(v),
                        validator: (_) => pr.isValueValid,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomTextField(
                        textKey: skey,
                        hintText: 'المصدر ',
                        controller: stc,
                        onChanged: (v) => pr.sourceChange(v),
                        validator: (_) =>
                            context.watch<CreateInCome>().isSourceValide,
                      ),
                      if (pr.sources.isNotEmpty)
                        SizedBox(
                          height: pr.sources.length * 50,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            itemCount: pr.sources.length,
                            itemBuilder: (context, index) => GestureDetector(
                              child: Card(
                                child: Text(
                                  pr.sources[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                              onTap: () {
                                stc.text = pr.sources[index];
                                pr.selctSourc(index);
                              },
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        height: 120,
                        child: date.DatePicker(DateTime.now(),
                            locale: 'ar',
                            selectionColor: Colors.blueGrey,
                            monthTextStyle: Styles.textb18,
                            initialSelectedDate: pr.date,
                            onDateChange: (selectedDate) {
                          pr.setDate(selectedDate);
                        }),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            pr.save();
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
