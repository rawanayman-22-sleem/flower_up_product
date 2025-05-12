import 'package:flower_up_product/core/widgets/imagr_feild.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_text_form_field.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20 , left: 20, right: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _fromkey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                Customformtextfield(
                  maxLines: 1,
                  labelText: 'Product Name',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  labelText: 'Price',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  labelText: 'Product Code',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 5,
                  labelText: 'Product Description',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                ImagrFeild()

              ]

            )
        ),
      ),
    );
  }
}
