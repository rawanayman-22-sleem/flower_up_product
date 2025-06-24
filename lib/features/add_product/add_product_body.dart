import 'dart:io';
import 'package:flower_up_product/core/manger/add_product_cubit.dart';
import 'package:flower_up_product/core/widgets/constants.dart';
import 'package:flower_up_product/core/widgets/imagr_feild.dart';
import 'package:flower_up_product/core/widgets/isEdibleDecoration_box.dart';
import 'package:flower_up_product/features/add_product/domin/entities/add_product_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../core/widgets/terms_and_conditions.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name , code , description , type , occasion ;
  late num price , number;
   File? image;
   bool termsandconditions = false;
   bool edibleDecoration = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10 , left: 20, right: 20),
      child: SingleChildScrollView(
        child: Form(
          key: _fromkey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                SizedBox(height: 20),

                Customformtextfield(
                  maxLines: 1,
                  onSaved: (value) {
                    name = value!;
                  },
                  labelText: 'Product Name',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  onSaved: (value) {
                    type = value! ;
                  },
                  labelText: 'Type Name',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  onSaved: (value) {
                    number = num.parse(value!);
                  },
                  labelText: 'Number of Flowers ',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  onSaved: (value) {
                    occasion = value!;
                  },
                  labelText: 'occasion Product ',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  labelText: 'Price',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 1,
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  labelText: 'Product Code',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                Customformtextfield(
                  maxLines: 5,
                  onSaved: (value) {
                    description = value!;
                  },
                  labelText: 'Product Description',
                  keyboardType: TextInputType.text,
                ),

                SizedBox(height: 16,),

                ImagrFeild(
                  onFileChange: (image) {
                    this.image = image;
                  },
                ),

                SizedBox(height: 16,),

                TermsAndConditionsWidget(
                  onChanged: (value) {
                    termsandconditions = value;
                  },
                ),
                SizedBox(height: 13,),
                EdibleDecorationckeckBox(
                  onChanged: (value) {
                    edibleDecoration = value;
                  },
                ),

                SizedBox(height: 22,),

                CustomButton(
                  onTap: ()
    {
      if (_fromkey.currentState!.validate()) {
        _fromkey.currentState!.save();
        AddProductEntites input = AddProductEntites(
            name: name,
            code: code,
            description: description,
            price: price,
            image: image!,
            termsandconditions: termsandconditions,
            type: type,
            number: number.toInt(),
            occasion: occasion,
            reviews: []);
        context.read<AddProductCubit>().addProduct(input);
           }
             else {
            setState(() {
             autovalidateMode = AutovalidateMode.always;
             setState(() {});
             });
               showError(context);
            }
                  },
                  text: 'Add product',
                ),

                SizedBox(height: 16,),
              ]

            )
        ),
      ),
    );
  }

  void showError(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an Image'),
    ));
  }
}

