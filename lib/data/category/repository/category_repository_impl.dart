import 'package:dartz/dartz.dart';
import 'package:flutter_project/data/category/models/category.dart';
import 'package:flutter_project/data/category/source/category_firebase_service.dart';
import 'package:flutter_project/domain/category/repository/category.dart';

import '../../../service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository{
  @override
  Future<Either> getCategories() async {
    var categories =  await s1<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error){
        return Left(error);
      },
      (data){
        return Right(
          List.from(data).map((e) => CategoryModel.fromMap(e).toEntity()).toList()
        );
      }
    );
  }

}