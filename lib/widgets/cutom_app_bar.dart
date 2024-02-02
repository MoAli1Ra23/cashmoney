import 'package:cashmoney/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.rightIcon,
      this.liftIcon,
      this.onRightPreess,
      this.onLiftPreess,
      this.buttonColor, this.title});
  final Widget? rightIcon; 
  final Widget? title ;
  final Widget? liftIcon;
  final Function()? onRightPreess;
  final Function()? onLiftPreess;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(onPressed: onRightPreess, icon: rightIcon!),
          title??const SizedBox(width: 50,),
          CustomButton(onPressed: onRightPreess, icon: rightIcon!)
        ],
      ),
    );
  }
}

