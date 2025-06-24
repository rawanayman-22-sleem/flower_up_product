import 'package:dartz/dartz.dart';
import 'package:flower_up_product/errors/failures.dart';
import 'package:flower_up_product/features/add_product/domin/entities/add_product_input.dart';

abstract class ProductsRepo {
  Future<Either<Failure , void>> addProduct(
      AddProductEntites addProductEntities);
}