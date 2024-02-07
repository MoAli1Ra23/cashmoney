import 'package:cashmoney/feature/home/UI/view/widgets/button_row.dart';
import 'package:cashmoney/feature/home/UI/view/widgets/wallate_balance.dart';
import 'package:cashmoney/shared/styles/styles.dart';
import 'package:cashmoney/widgets/cutom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_reusable_app_bar.dart';

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  double y = 0;
  double x = 0;
  double z = 0;
  bool isOpen = false;

  double scaleFactor = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          body: Stack(
            children: [
              Container(
                color: const Color.fromARGB(255, 50, 65, 50),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.white,
                transform: Matrix4.translationValues(x, y, 0)
                  ..scale(scaleFactor),
                child: Column(
                   children: [
                    const SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  16.0),
                      child: CustomReusableAppBar(
                        title: "CashMoney",
                        titleStyle:  Styles.textb30,
                        onRightTab: () {
                          setState(() {
                            if (!isOpen) {
                              // scaleFactor = .6;
                              // x = 230;
                              // y = 150; //MediaQuery.of(context).size.height*0.2;
                              // z = MediaQuery.of(context).size.height * -0.2;
                                        
                              isOpen = true;
                            } else {
                              // scaleFactor = 1;
                              // x = 0;
                              // y = 0;
                              // isOpen = false;
                            }
                                        
                            print(y);
                            print(z);
                            print(x);
                            print(scaleFactor);
                          });
                        },
                        leftIcon: isOpen
                            ? const Icon(Icons.arrow_back_ios_new_rounded)
                            : const Icon(Icons.menu_open_rounded),
                        righeIcon: const Icon(Icons.menu_open_rounded),
                        
                      ),
                    ),
                    const Spacer(),
                    const Hero(tag: "mony", child: WallateBalance()),
                    const Spacer(flex: 3,),

                    const ButtonsRow(),
                    const Spacer(flex: 2,),

                  ],
                ),
              ),
            ],
          )),
    );
  }
}
