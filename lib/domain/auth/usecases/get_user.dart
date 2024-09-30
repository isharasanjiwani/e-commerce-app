import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/usecase/usecase.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class GetUserUseCase extends UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async {
    return await s1<AuthRepository>().getUser();
  }
}