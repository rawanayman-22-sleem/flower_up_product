import 'package:flower_up_product/core/image_repo/image_repo.dart';
import 'package:flower_up_product/core/image_repo/image_repo_imp.dart';
import 'package:flower_up_product/core/repos/product_repo_imp.dart';
import 'package:flower_up_product/core/repos/products_repo.dart';
import 'package:flower_up_product/core/services/data_service.dart';
import 'package:flower_up_product/core/services/file_storage.dart';
import 'package:flower_up_product/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'storage_service.dart';


final getIt = GetIt.instance;

void setupGetit() {
  if (!getIt.isRegistered<StorageSerivce>()) {
    getIt.registerSingleton<StorageSerivce>(FireStorage());
  }

  if (!getIt.isRegistered<DatabaseService>()) {
    getIt.registerSingleton<DatabaseService>(FireStoreService());
  }

  if (!getIt.isRegistered<ProductsRepo>()) {
    getIt.registerSingleton<ProductsRepo>(
      ProductRepoImp(getIt.get<DatabaseService>()),
    );
  }

  if (!getIt.isRegistered<ImageRepo>()) {
    getIt.registerSingleton<ImageRepo>(
      ImageRepoImp(getIt.get<StorageSerivce>()),
    );
  }
}

// final getIt = GetIt.instance;
//
// void setupGetit() {
//   getIt.registerSingleton<StorageSerivce>(FireStorage());
//
//   getIt.registerSingleton<DatabaseService>(FireStoreService());
//
//   getIt.registerSingleton<ProductsRepo>(ProductRepoImp(
//     getIt.registerSingleton(getIt.get<DatabaseService>()),));
//
//   getIt.registerSingleton<ImageRepo>(ImageRepoImp(
//       getIt.get<StorageSerivce>()));
//
// }