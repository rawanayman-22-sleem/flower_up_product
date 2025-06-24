import 'package:flutter/material.dart';
import 'colors.dart';


class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,required this.text});

  VoidCallback? onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: pink,
            borderRadius: BorderRadius.circular(6)
        ),
        //width: double.infinity,
        width: 350,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: background
            ),
          ),
        ),
      ),
    );
  }
}