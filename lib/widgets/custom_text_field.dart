// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.errorText,
    this.prefixIcon,
     this.prefixIconColor,
    required this.onChanged,
    required this.validator,
    this.floatingLabelAlignment,
    this.height,
    this.width,
    this.controller,
    this.textKey,
    this.keyboardType,
  }) : super(key: key);
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
   final Color? prefixIconColor;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final FloatingLabelAlignment? floatingLabelAlignment;

  final double? height;
  final double? width;
  final TextEditingController? controller;
  final GlobalKey? textKey;
final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: height?? 70,
      width: width,
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(15),
       boxShadow: [
        
          BoxShadow(
          color:   Colors.blueGrey.shade400,
          offset:   const Offset(-1, 5),
          blurRadius: 3,
           spreadRadius: .2,
            
        ),
 
      ]),
      child: TextFormField(
        
         keyboardType: keyboardType,
        controller: controller,
        key: textKey,
        decoration: InputDecoration(
           floatingLabelAlignment:floatingLabelAlignment,
          border: InputBorder.none,
          hintText: hintText,
          errorText: errorText,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
