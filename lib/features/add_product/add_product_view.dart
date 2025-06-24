import 'package:flower_up_product/core/manger/add_product_cubit.dart';
import 'package:flower_up_product/core/services/get_service.dart';
import 'package:flower_up_product/core/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/image_repo/image_repo.dart';
import '../../core/repos/products_repo.dart';
import '../../core/widgets/add_product_view_body_bloc.dart';
import 'add_product_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Add product',),
        backgroundColor: textcolor,
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: AddProductViewBodyBloc(),
      ),

    );
  }
}

