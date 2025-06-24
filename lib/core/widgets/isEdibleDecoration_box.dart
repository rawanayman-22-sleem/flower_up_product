import 'package:flutter/material.dart';
import 'custom_check_box.dart';

class EdibleDecorationckeckBox extends StatefulWidget {
  const EdibleDecorationckeckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<EdibleDecorationckeckBox> createState() =>
      _EdibleDecorationckeckBoxState();
}

class _EdibleDecorationckeckBoxState extends State<EdibleDecorationckeckBox> {
  bool isEdibleDecorationAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isEdibleDecorationAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isEdibleDecorationAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'Is Product EdibleDecoration? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                    )
                ),

              ],
            ),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );
  }
}

