import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/product/entity/product.dart';
import 'color.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final num salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map["categoryId"],
      colors: map['colors'].map<ProductColorModel>((e) => ProductColorModel.fromMap(e)).toList(),
      createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map["discountedPrice"] as num,
      gender: int.parse(map["gender"]),
      images: map['images'].map<String>((e) => e.toString()).toList(),
      price: map["price"] as num,
      sizes: map['sizes'].map<String>((e) => e.toString()).toList(),
      productId: map["productId"],
      salesNumber: map["salesNumber"] as num,
      title: map["title"],
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity(){
    return ProductEntity(
        categoryId: categoryId,
        colors: colors.map((e) => e.toEntity()).toList(),
        createdDate: createdDate,
        discountedPrice: discountedPrice,
        gender: gender,
        images: images,
        price: price,
        sizes: sizes,
        productId: productId,
        salesNumber: salesNumber,
        title: title
    );
  }
}