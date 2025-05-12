import 'package:flutter/material.dart';

class ImagrFeild extends StatelessWidget {
  const ImagrFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 160,
          color: Colors.grey[600],
        ),
      ),
    );

  }
}
