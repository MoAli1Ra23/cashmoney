// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cashmoney/feature/incomes/domain/entity/income.dart';
import 'package:cashmoney/feature/wallate/UI/wallate_view_model.dart';
import 'package:cashmoney/shared/styles/styles.dart';
import 'package:cashmoney/widgets/custom_reusable_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../home/UI/view/widgets/wallate_balance.dart';
import '../view_model/manage_incomes.dart';
import '../widget/income_list_item.dart';
import '../widget/multi_func_list.dart';
import 'create_income_page.dart';

class ManageIcomesPage extends StatelessWidget {
  const ManageIcomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ManageIcomes>().income();
    return Scaffold(

        // appBar: AppBar(
        //   elevation: 5,
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        //   title: const Text(
        //     " الدخل",
        //     style: TextStyle(
        //       //style
        //       fontWeight: FontWeight.bold,
        //       fontSize: 22,
        //     ),
        //   ),
        // ),

        body: //const Center(child: Text("ddd")),
            SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 10),
              child: CustomReusableAppBar(
                title: "الدخل",
                titleStyle: Styles.textb30,
                leftIcon: const Icon(Icons.arrow_back_ios_new_rounded),
                righeIcon: const Icon(Icons.add_rounded),
                onLeftTab: () => Navigator.of(context).pop(),
                onRightTab: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CreateInComePage(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Hero(tag: "mony", child: WallateBalance()),
            Consumer<ManageIcomes>(
              builder: (_, incomeProvider, n) {
                incomeProvider.income();
                if (incomeProvider.loading|| incomeProvider.incomes.isEmpty) {
                  return const Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height:100,),
                      Text(
                        "No Icome",
                        style: Styles.text14,
                      ),
                    ],
                  );
                } else {
                  return MultiFuncList<Income>(
                      height: MediaQuery.of(context).size.height *.70,
                      onDeleteAll: (List p0) {
                        incomeProvider.deleteAll(p0.cast());

                        context.read<WallateViewModel>().getValue();
                      },
                      onDismiss: (p0) {
                        // incomeProvider.delete(p0);
                      },

                      items: incomeProvider.incomes,
                      builder: (context, index) {
                        return IncomeListItem(
                            income: incomeProvider.incomes[index]);
                      });
                }
              },
            )
          ],
        ),
      ),
    )
        // ListIncoms(incomes:)

        // body: IncomeList(
        //   incomeProvider:
        //   Provider.of<ManageIcomes>(context, listen: true),
        // ),
        );
  }
}

/// deprecated
///
class IncomeList extends StatelessWidget {
  const IncomeList({
    Key? key,
    required this.incomeProvider,
  }) : super(key: key);
  final ManageIcomes incomeProvider;

  @override
  Widget build(BuildContext context) {
    var ll = incomeProvider.incomes;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
        itemCount: ll.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    ll[index].value.toString(),
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Text(
                    ll[index].source.toString(),
                    style: TextStyle(
                      color: Colors.red.shade600,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
