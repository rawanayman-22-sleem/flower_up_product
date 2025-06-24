import 'dart:io';
import 'package:flower_up_product/core/models/review_model.dart';
import 'package:flower_up_product/features/add_product/domin/entities/add_product_input.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool termsandconditions;
  String? imageUrl;
  final String type;
  final int number;
  final String occasion; //مناسبة الطلب (زفاف ..)
  final bool isEdibleDecoration ; //قابلة للأكل؟
  final num avgRating = 0;
  final num ratingCount = 0;
  final int sellingcount;
  final List<ReviewModel> reviews;

  AddProductModel( {
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.termsandconditions,
    this.imageUrl,
    this.sellingcount = 0,
    required this.type,
    required this.number,
    required this.occasion,
    required this.isEdibleDecoration,
    required this.reviews,});

  factory AddProductModel.fromEntity(
      AddProductEntites addProductEntites) {
    return AddProductModel(
        name: addProductEntites.name,
        code: addProductEntites.code,
        description: addProductEntites.description,
        price: addProductEntites.price,
        image: addProductEntites.image,
        termsandconditions: addProductEntites.termsandconditions,
        imageUrl:addProductEntites.imageUrl,
        type: addProductEntites.type,
        number: addProductEntites.number,
        occasion: addProductEntites.occasion,
        isEdibleDecoration: addProductEntites.isEdibleDecoration,
        reviews: addProductEntites.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),

    );

  }
  toJson() {
    return {
      'name':name,
      'code':code,
      'description':description,
      'price':price,
      //'image':image.path,
      'termsandconditions':termsandconditions,
      'imageUrl':imageUrl,
      'type': type,
      'number': number,
      'occasion': occasion,
      'isEdibleDecoration': isEdibleDecoration,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'sellingcount': sellingcount,

    };
  }

}