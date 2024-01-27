import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../wallate/UI/wallate_view_model.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<WallateViewModel>().getValue();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: const Text(
            "اضافة دخل",
            style: TextStyle(
              //style
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        body: Form(
          key: k,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Consumer<CreateInCome>(
                  builder: (_, pr, __) => TextFormField(
                    key: vkey,
                    controller: tc,
                    onChanged: (v) => pr.validateValue(v),
                    validator: //(value) => pr.isValueValid,
                        (_) => context.watch<CreateInCome>().isValueValid,
                    decoration: InputDecoration(
                        // errorText: pr.isValueValid,
                        label: const Text("القيمة"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Consumer<CreateInCome>(
                  builder: (_, pr, __) => TextFormField(
                    key: skey,
                    controller: stc,
                    onChanged: (v) => pr.validateSource(v),
                    validator: // (value) => pr.isValueValid,
                        (_) => context.watch<CreateInCome>().isSourceValide,
                    decoration: InputDecoration(
                        // errorText: pr.isValueValid,
                        label: const Text("المصدر"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Consumer<CreateInCome>(
                  builder: (__, pr, _) {
                    if (pr.sources.isNotEmpty) {
                      return SizedBox(
                        height: pr.sources.length * 50,
                        child: ListView.builder(
                          itemCount: pr.sources.length,
                          itemBuilder: (context, index) => GestureDetector(
                            child: Text(
                              pr.sources[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            onTap: () {
                              stc.text = pr.sources[index];
                              pr.selctSourc(index);
                            },
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox(
                        height: 0,
                      );
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CreateInCome>(context, listen: false).save();
                    },
                    child: const Text(
                      "Save",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
