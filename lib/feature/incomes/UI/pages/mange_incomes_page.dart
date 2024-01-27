// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/manage_incomes.dart';
import 'create_income_page.dart';

class ManageIcomesPage extends StatelessWidget {
  const ManageIcomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final incomeProvider = ;
    // var ll = incomeProvider.incomes;

    context.read<ManageIcomes>().income();
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: const Text(
            " الدخل",
            style: TextStyle(
              //style
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>   CreateInComePage(),
              ),
            );
          },
          child: const Icon(Icons.add)),
      body: IncomeList(
        incomeProvider: 
        Provider.of<ManageIcomes>(context, listen: true),
      ),
    );
  }
}

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
      padding: const EdgeInsets.symmetric( horizontal:10.0),
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
