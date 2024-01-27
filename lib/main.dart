import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/expenses/UI/page/manage_expenses_page.dart';
import 'feature/expenses/UI/view_model/create_expenses.dart';
import 'feature/expenses/UI/view_model/manage_expenses.dart';
import 'feature/incomes/UI/pages/mange_incomes_page.dart';
import 'feature/incomes/UI/view_model/create_income.dart';
import 'feature/incomes/UI/view_model/manage_incomes.dart';
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
  ], child: const MyApp()));
// });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home: const MyMain(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyMain extends StatelessWidget {
  const MyMain({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, 3),
                    blurRadius: 2,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.outer),
              ],
            ),
            child: Row(
              children: [
                Consumer<WallateViewModel>(
                  builder: (context, pt, child) {
                    print(pt.text);
                    return Text(
                      "الرصيد=${pt.text}",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ManageIcomes>().income();

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return const ManageIcomesPage();
                    }),
                  );
                },
                child: Container(
                  height: h * .3,
                  width: w * .45,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color:Colors.blue.shade100,offset: const Offset(0,5),blurRadius: .3,blurStyle: BlurStyle.outer,spreadRadius:.5)],
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                    child: Text(
                      "الدخل",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ManageExpensesPage(),
                  ));
                },
                child: Container(
                  height: h * .3,
                  width: w * .45,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(25)),
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
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}