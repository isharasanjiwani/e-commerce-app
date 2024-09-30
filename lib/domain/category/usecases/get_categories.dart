import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/usecase/usecase.dart';
import 'package:flutter_project/domain/category/repository/category.dart';

import '../../../service_locator.dart';

class GetCategoriesUseCase extends UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async {
    return await s1<CategoryRepository>().getCategories();
  }

}