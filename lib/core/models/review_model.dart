import 'package:flower_up_product/features/add_product/domin/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String reviewDescription;
  final num ratting;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.reviewDescription,
    required this.ratting});

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
        name: reviewEntity.name,
        image: reviewEntity.image,
        date: reviewEntity.date,
        ratting: reviewEntity.ratting,
      reviewDescription: reviewEntity.reviewDescription, );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        name: json['name'],
        image: json['image'],
        date: json['date'],
        ratting: json['ratting'],
      reviewDescription: json['reviewDescription'],);
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'reviewDescription': reviewDescription
    };
  }
}