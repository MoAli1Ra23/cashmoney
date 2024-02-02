import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.icon, this.buttonColor});
  final Function()? onPressed;
  final Widget? icon;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.shade600,
              offset: const Offset(1, 3),
              blurRadius: 3,
              spreadRadius: 0)
        ],
      ),
      child: IconButton(onPressed: onPressed, icon: icon!),
    );
  }
}
