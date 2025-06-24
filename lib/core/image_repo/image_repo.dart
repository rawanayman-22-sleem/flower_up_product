import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flower_up_product/errors/failures.dart';

abstract class ImageRepo {
  Future<Either<Failure , String>> uploadImage(File image);
}