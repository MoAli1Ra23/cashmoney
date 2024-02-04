// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cashmoney/feature/report/UI/view_model/general_report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/expenses/UI/page/manage_expenses_page.dart';
import 'feature/expenses/UI/view_model/create_expenses.dart';
import 'feature/expenses/UI/view_model/manage_expenses.dart';
import 'feature/incomes/UI/pages/mange_incomes_page.dart';
import 'feature/incomes/UI/view_model/create_income.dart';
import 'feature/incomes/UI/view_model/manage_incomes.dart';
import 'feature/report/UI/page/generate_report_view.dart';
import 'feature/wallate/UI/wallate_view_model.dart';
import 'injection.dart';

void main() {
  configureDependencies("prod");
  WidgetsFlutterBinding.ensureInitialized();

// return runZonedGuarded(()async{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ManageIcomes(),
    ),
    ChangeNotifierProvider<ManageExpenses>(
      create: (context) => ManageExpenses(),
    ),
    ChangeNotifierProvider<CreateInCome>(
      create: (context) => CreateInCome(),
    ),
    ChangeNotifierProvider<CreateExpenses>(
      create: (context) => CreateExpenses(),
    ),
    ChangeNotifierProvider(
      create: (context) => WallateViewModel()..getValue(),
    ),
    ChangeNotifierProvider(
      create: (context) => GeneralReportViewModel(),
    ),
  ], child: const MyApp()));
// });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Cairo',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.blueGrey.shade50),
      // home: const GeneralReportView(),
      home: const MyMain(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.shade700,
                        offset: const Offset(0, 6),
                        blurRadius: 10,
                        spreadRadius: -5,
                        blurStyle: BlurStyle.outer),
                  ],
                ),
                child: Row(
                  children: [
                    Consumer<WallateViewModel>(
                      builder: (context, pt, child) {
                        return Text(
                          "الرصيد=${pt.text}",
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue.shade400,
                           shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(10),
                              bottomStart: Radius.circular(10),
                            ),
                          )),
                      onPressed: () {
                        // context.read<ManageIcomes>().income();

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return const ManageIcomesPage();
                          }),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "الدخل",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromARGB(184, 242, 238, 238)),
                        ),
                      ),
                    ),
                     
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const GeneralReportView(),
                        ));
                      },
                      child: const Center(
                        child: Text(
                          "التقارير",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ManageExpensesPage(),
                        ));
                      },
                      child: const Center(
                        child: Text(
                          "النفقات",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(2, 5), color: Colors.blueGrey.shade700)
      ]),
      child: OutlinedButton(
        onPressed: onPressed,
        // style: OutlinedButton.styleFrom(
        //   backgroundColor: Colors.red,
        //   shadowColor: Colors.green,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(
        //         15,
        //       ),
        //       bottomRight: Radius.circular(
        //         15,
        //       ),
        //     ),
        //   ),
        // )
        
        child: Text(text),
      ),
    );
  }
}
