import 'package:flower_up_product/core/widgets/colors.dart';
import 'package:flutter/material.dart';

import 'add_product_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text('Add product', ),
        backgroundColor: textcolor,
      ),
      body: AddProductBody(),

    );
  }
}
