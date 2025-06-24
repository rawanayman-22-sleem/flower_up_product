import 'dart:io';

import 'review_entity.dart';

class AddProductEntites {
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
  final List<ReviewEntity> reviews;


  AddProductEntites({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.termsandconditions,
     this.imageUrl,
    required this.type,
    required this.number,
    required this.occasion,
     this.isEdibleDecoration = false,
    required this.reviews,});


}