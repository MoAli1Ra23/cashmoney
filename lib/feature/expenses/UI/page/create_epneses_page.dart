import 'package:cashmoney/feature/wallate/UI/wallate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/styles/styles.dart';
import '../../../../widgets/custom_reusable_app_bar.dart';
import '../../../../widgets/custom_text_field.dart';
import '../view_model/create_expenses.dart';

class CreateExpensesPage extends StatelessWidget {
  CreateExpensesPage({super.key});
  final kForm = GlobalKey<FormState>();
  final kVlaue = GlobalKey();
  final ktitle = GlobalKey();
  final kdetials = GlobalKey();
  final vc = TextEditingController(text: "0.0");
  final dc = TextEditingController();
  final tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 10),
                child: CustomReusableAppBar(
                  title: "إضافة نفقات",
                  titleStyle: Styles.textb30,
                  leftIcon: const Icon(Icons.arrow_back_ios_new_rounded),
                  righeIcon: const Icon(Icons.add_rounded),
                  onLeftTab: () => Navigator.of(context).pop(),
                  onRightTab: () {},
                ),
              ),
              Consumer<CreateExpenses>(
                builder: (context, pr, _) => Form(
                  key: kForm,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              BoxDecoration(color: Colors.blue.shade600),
                          child: pr.masge != null
                              ? Text(
                                  pr.masge!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )
                              : const SizedBox(height: 0),
                        ),

                        ///
                        CustomTextField(
                          hintText: "القيمة",
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textKey: kVlaue,
                          controller: vc,
                          onChanged: (value) => pr.validateValue(value),
                          validator: (_) => pr.isValueValid,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // ExpnesesTypeChoser(onSelect:(value)=> pr.validateTitle(value),),

                        CustomTextField(
                          textKey: ktitle,
                          controller: tc,
                          keyboardType: TextInputType.text,
                          hintText: "البند",
                          onChanged: (value) => pr.validateTitle(value),
                          validator: (_) => pr.isTitleValid,
                        ),
                        if (pr.titles.isNotEmpty || pr.titles == null)
                          SizedBox(
                            height: pr.titles.length * 50,
                            child: ListView.builder(
                                itemCount: pr.titles.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      tc.text = pr.titles[index].text;

                                      pr.setTitel(pr.titles[index].text);
                                    },
                                    child: ListTile(
                                      trailing: pr.titles[index].icon == null
                                          ? const Icon(Icons.edit)
                                          : pr.titles[index].icon!,
                                      iconColor: Colors.pink.shade400,
                                      title: Text(
                                        pr.titles[index].text,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        const SizedBox(
                          height: 15,
                        ),

                        CustomTextField(
                          textKey: kdetials,
                          controller: dc,
                          keyboardType: TextInputType.text,
                          // label: const Text("التفاصيل"),
                          hintText: "التفاصيل",
                          onChanged: (value) => pr.validateDetalils(value),
                          validator: (_) => pr.isDetailsValid,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          hintText: "ملاحظات",
                          onChanged: (value) {},
                          validator: null,
                        ),
                        //
                        const SizedBox(
                          height: 15,
                        ),
                        Consumer<WallateViewModel>(
                          builder: (context, value, child) => ElevatedButton(
                            onPressed: () async {
                              pr.save();
                              value.getValue();
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
