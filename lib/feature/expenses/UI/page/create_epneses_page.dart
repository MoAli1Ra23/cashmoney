import 'package:cashmoney/feature/wallate/UI/wallate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/styles/styles.dart';
import '../../../../widgets/cutom_app_bar.dart';
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
              const CustomAppBar(
                rightIcon: Icon(Icons.arrow_back_ios_new_rounded),
                title: Text(
                  "إضافة نفقات",
                  style: Styles.textb30,
                ),
                liftIcon: Icon(Icons.arrow_back_ios_new_rounded),
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
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(.4),
                                offset: const Offset(0, 3),
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer),
                            BoxShadow(
                                color: Colors.grey.withOpacity(.4),
                                offset: const Offset(0, .3),
                                blurRadius: 5,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child: TextFormField(
                            key: kVlaue,
                            controller: vc,
                            onChanged: (value) => pr.validateValue(value),
                            validator: (_) => pr.isValueValid,
                            decoration: InputDecoration(
                                label: const Text("القيمة"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          key: ktitle,
                          controller: tc,
                          onChanged: (value) => pr.validateTitle(value),
                          validator: (_) => pr.isTitleValid,
                          decoration: InputDecoration(
                              label: const Text("البند"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          key: kdetials,
                          controller: dc,
                          onChanged: (value) => pr.validateDetalils(value),
                          validator: (_) => pr.isDetailsValid,
                          decoration: InputDecoration(
                              label: const Text("التفاصيل"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onChanged: (value) => pr.validateDetalils(value),
                          validator: (_) => pr.isValueValid,
                          decoration: InputDecoration(
                              label: const Text("ملاحظات"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        ),
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
