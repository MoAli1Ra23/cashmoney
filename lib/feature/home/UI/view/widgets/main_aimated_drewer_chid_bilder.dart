// ignore_for_file: public_member_api_docs, sort_constructors_first
 
import 'package:flutter/material.dart';

import 'package:cashmoney/shared/styles/styles.dart';
 
import '../../../../../widgets/custom_reusable_app_bar.dart';
import '../../../../expenses/UI/page/manage_expenses_page.dart';
import '../../../../incomes/UI/pages/mange_incomes_page.dart';
import '../../../../report/UI/page/generate_report_view.dart';

class MainChangAnimatedDrewerChildBiulder extends StatefulWidget {
  const MainChangAnimatedDrewerChildBiulder({super.key});

  @override
  State<MainChangAnimatedDrewerChildBiulder> createState() =>
      _MainChangAnimatedDrewerChildBiulderState();
}

class _MainChangAnimatedDrewerChildBiulderState
    extends State<MainChangAnimatedDrewerChildBiulder>
    with SingleTickerProviderStateMixin 
    {
  late Widget Function(BuildContext) builder;
late Animation<RelativeRect> scale;
late AnimationController scaleController;
Tween<RelativeRect> t=Tween<RelativeRect>( );
@override
initState(){
  scaleController=AnimationController(vsync: this,duration: const Duration(seconds: 1));
  scale=t.animate(scaleController);
  super.initState();


}


  List<Widget> page = [
    const ManageIcomesPage(),
    const ManageExpensesPage(),
    const GeneralReportView()
  ];
  int index = 0;
  void onIndexChanged(int inn) {
    setState(() {
      index = inn;

      onBackpress();
    });
  }
 

  bool isOpen = false;
  double x = 0;
  double y = 0;
  double z = 0;
  double scaleFactor = 1;
 double pp=20;
  void onBackpress({double? h, double? w}) {
    h=h??800;
    w=w??400;
   t.end=RelativeRect.fromLTRB(w!*5, 0, w, h!);
  
    
    print(isOpen);
    setState(() {
      if (isOpen) {
        x = 0;
        y = 0;
        z = 0;
        pp=20;
         scaleController.forward();
        scaleFactor = 1;
        isOpen = false;
      } else {
        x = h! * 0.2;
        y = w! * 0.65;
        z = 0;
       pp=w*0.35;
                scaleController.reverse();


        scaleFactor = .6;
        isOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    t.begin=RelativeRect.fromLTRB(0, 0, h, w);
    print((x / h) * 100);

    print((y / w) * 100);
    print(h);
    print(w);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DrawerList(onIndexChanged: onIndexChanged,pHeight: h,pWidth: w,),

          PositionedTransition(rect:scale , child:  ListView(physics: const ClampingScrollPhysics(), children: [
                            SizedBox(
              height: 60,
              child: CustomReusableAppBar(
                  title: "",
                  leftIcon: isOpen
                      ? const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        )
                      : const Icon(Icons.menu_open_sharp),
                  onLeftTab: () {
                    onBackpress(h: h, w: w);
                  },
                  righeIcon:  isOpen
                      ? const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        )
                      : const Icon(Icons.menu_open_sharp)
                  )
                            ),
                            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: page[index])
                          ]),
            ),

          // AnimatedContainer(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   color: Colors.grey.shade400,
          // ),
          // transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
          // // duration: const Duration(microseconds: 700),
          //  Container(
          //   height: h,
          //   width: w,
          //   constraints: BoxConstraints(maxWidth: w*.5),
          //   alignment:isOpen?Alignment.topCenter:Alignment.topCenter,
          //   margin: EdgeInsets.only(top: pp,bottom: pp),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   color: Colors.grey.shade400,
          // ),
          // // transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
          // // duration: const Duration(seconds: 5),
          //   child: ScaleTransition(
          //     scale: scale,
              
          // )
        
        ],
      ),
    );
  }
}

class DrawerList extends StatefulWidget {
  const DrawerList({
    Key? key,
    required this.onIndexChanged,
    required this.pHeight,
    required this.pWidth,
  }) : super(key: key);
  final void Function(int index) onIndexChanged;
final double pHeight;
final double pWidth;
  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final List<String> titles = ["النفقات", "الدخل", "التقارير"];
    final List<IconData> icons = [
      Icons.payment_rounded,
      Icons.money_off_csred_rounded,
      Icons.report_off_rounded
    ];

    return Container(
      margin: const EdgeInsets.only(top: 50,bottom: 150),
      height:  widget.pHeight,
      constraints: BoxConstraints(maxWidth: widget.pWidth*.5,minWidth: 0),
      color: Colors.greenAccent,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;


                widget.onIndexChanged(index);
                print(selectedIndex);
                print(index);
              });
            },
            child: Container(
              height: 60,
              color: index == selectedIndex ? Colors.blueGrey : Colors.blue,
              child: Row(
                children: [
                  Icon(icons[index]),
                  Text(
                    titles[index],
                    style: Styles.textb20.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
