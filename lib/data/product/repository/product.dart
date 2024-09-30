import 'package:dartz/dartz.dart';
import 'package:flutter_project/data/product/models/product.dart';
import 'package:flutter_project/data/product/source/product_firebase_service.dart';
import 'package:flutter_project/domain/product/repository/product.dart';

import '../../../service_locator.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await s1<ProductFirebaseService>().getTopSelling();
    return returnedData.fold(
      (error){
        return Left(error);
      },
      (data){
        return Right(
          List.from(data).map((e) => ProductModel.fromJson(e).toEntity()).toList()
        );
      }
    );
  }

}