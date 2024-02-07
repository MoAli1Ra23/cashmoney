// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomReusableAppBar extends StatelessWidget {
  const CustomReusableAppBar({
    Key? key,
    required this.title,
    this.onLeftTab,
    this.onRightTab,
    this.titleStyle,
    required this.leftIcon,
    required this.righeIcon,
  }) : super(key: key);
  final String title;
  final Function()? onLeftTab;
  final Function()? onRightTab;
  final TextStyle? titleStyle;
  final Icon leftIcon;
  final Icon righeIcon;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      InkWell(
        onTap: onLeftTab,
        child: Container(
          // height: 50,
          // width: 60,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3))
              ]),
          child: leftIcon,
        ),
      ),
      Text(title,style: titleStyle,),
      InkWell(
        onTap: onRightTab,
        child: Container(
          // height: 50,
          // width: 60,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 3))
              ]),
          child: righeIcon,
        ),
      ),
    ]);
  }
}
