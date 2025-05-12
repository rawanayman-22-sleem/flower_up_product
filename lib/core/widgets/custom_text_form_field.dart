import 'package:flutter/material.dart';
import 'colors.dart';


class Customformtextfield extends StatelessWidget {
  const Customformtextfield({
    super.key,
    required this.labelText,
    this.suffIcon,
    this.isSecured = false,
    this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.maxLines = 1,
  });
  final String labelText;
  final Widget? suffIcon;
  final Widget? prefixIcon;
  final int? maxLines  ;
  final bool isSecured;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ,
      controller: controller,
      obscureText: isSecured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This Field is Required";
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide:
          const BorderSide(color: pink, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: pink, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: pink, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
