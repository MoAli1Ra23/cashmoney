// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cashmoney/feature/report/UI/view_model/general_report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'feature/expenses/UI/view_model/create_expenses.dart';
import 'feature/expenses/UI/view_model/expense_type_chose.dart';
import 'feature/expenses/UI/view_model/manage_expenses.dart';
import 'feature/home/UI/view/my_main.dart';
import 'feature/incomes/UI/view_model/create_income.dart';
import 'feature/incomes/UI/view_model/manage_incomes.dart';
import 'feature/wallate/UI/wallate_view_model.dart';
import 'generated/l10n.dart';
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
    ChangeNotifierProvider(
      create: (context) => ExpenseTypeChoser(),
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
      locale: const Locale("ar"),
       localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
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
