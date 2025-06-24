import 'package:flower_up_product/core/manger/add_product_cubit.dart';
import 'package:flower_up_product/core/widgets/custom_porgress_hub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/add_product/add_product_body.dart';
import '../helper_function/build_error.dart';

class AddProductViewBodyBloc extends StatelessWidget {
  const AddProductViewBodyBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'Product added Sucessfully');
        }
        if (state is AddProductFailure) {
          buildBar(context, state.errMessage);

        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddProductLoading,
            child: AddProductBody());
      },
    );
  }
}
