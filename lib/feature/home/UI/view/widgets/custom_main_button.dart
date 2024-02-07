
import 'package:cashmoney/shared/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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

      child: Text(text,style: Styles.textb20,),
    );
  }
}
