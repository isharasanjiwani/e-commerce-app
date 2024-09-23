import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/usecase/usecase.dart';
import 'package:flutter_project/data/auth/models/user_creation_req.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either,UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await s1<AuthRepository>().signup(params!);
  }

}