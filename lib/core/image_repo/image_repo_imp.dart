import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flower_up_product/core/image_repo/image_repo.dart';
import 'package:flower_up_product/core/services/storage_service.dart';
import 'package:flower_up_product/errors/failures.dart';
import '../widgets/constants.dart';

class ImageRepoImp implements ImageRepo {

  final StorageSerivce storageSerivce;

  ImageRepoImp(this.storageSerivce);

  @override
  Future<Either<Failure , String>> uploadImage(File image) async {
     try {
       String URL = await storageSerivce.uploadFile(image, BackEndpoint.images);
       return Right(URL);
     }  catch (e) {
       return left(ServerFailure('Failed to upload image'));

     }
  }
}