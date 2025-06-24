import 'package:dartz/dartz.dart';
import 'package:flower_up_product/core/models/addProduct_input_model.dart';
import 'package:flower_up_product/core/repos/products_repo.dart';
import 'package:flower_up_product/core/services/data_service.dart';
import 'package:flower_up_product/core/widgets/constants.dart';
import 'package:flower_up_product/features/add_product/domin/entities/add_product_input.dart';
import '../../errors/failures.dart';

class ProductRepoImp implements ProductsRepo {

  final DatabaseService databaseService;
  ProductRepoImp(this.databaseService);
  @override
  Future<Either<Failure , void>>  addProduct(
AddProductEntites addProductEntities) async {
    try {
      await databaseService.addData(
      path: BackEndpoint.addProductsCollection,
      data: AddProductModel.fromEntity(addProductEntities).toJson(),
      );
      return Right(null);
  }
   catch (e) {
      return Left(ServerFailure('Failed to add product '));
}
  }
}