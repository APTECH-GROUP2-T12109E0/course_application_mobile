import 'dart:ffi';

class CourseDTO {
  String? id;
  String? title;
  String? author;
  String? price;
  String? salePrice;
  bool? isSale;
  String? rate;
  String? voteCount;
  String? tag;
  String? description;
  String? expiredTime;
  String? view;
  String? imageUrl;
  CourseDTO({this.id, this.title, this.author, this.price,
    this.salePrice, this.rate, this.voteCount, this.isSale,
    this.tag, this.description, this.expiredTime, this.view, this.imageUrl});
}