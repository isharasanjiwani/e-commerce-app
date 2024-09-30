import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/usecase/usecase.dart';

import '../../../service_locator.dart';
import '../repository/product.dart';

class GetTopSellingUseCase extends UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async {
    return await s1<ProductRepository>().getTopSelling();
  }

}