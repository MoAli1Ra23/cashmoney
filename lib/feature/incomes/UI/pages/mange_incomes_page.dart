// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cashmoney/feature/incomes/domain/entity/income.dart';
import 'package:cashmoney/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/cutom_app_bar.dart';
import '../view_model/manage_incomes.dart';
import '../widget/income_list_item.dart';
import '../widget/multi_func_list.dart';
import 'create_income_page.dart';

class ManageIcomesPage extends StatelessWidget {
  const ManageIcomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ManageIcomes>().income();
    final incomeProvider = Provider.of<ManageIcomes>(context);
    incomeProvider.income();
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

        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CreateInComePage(),
                ),
              );
            },
            child: const Icon(Icons.add)),
        body: //const Center(child: Text("ddd")),
            SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            child: Column(
              children: [
                const CustomAppBar(
                  rightIcon: Icon(Icons.arrow_back_ios_new_rounded),
                  title: Text("الدخل",style: Styles.textb30,),
                  liftIcon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                const SizedBox(height: 10,),
                MultiFuncList<Income>(
                  height: MediaQuery.of(context).size.height-200,
                    onDeleteAll: (p0) {
                      incomeProvider.deleteAll(p0);
                    },
                    onDismiss: (p0) {
                      incomeProvider.delete(p0);
                    },
                    items: incomeProvider.incomes,
                    builder: (context, index) {
                      return IncomeListItem(
                          income: incomeProvider.incomes[index]);
                    }),
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
