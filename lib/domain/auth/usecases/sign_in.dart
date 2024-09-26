import 'package:dartz/dartz.dart';
import 'package:flutter_project/core/usecase/usecase.dart';
import 'package:flutter_project/data/auth/models/user_sign_in_req.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class SignInUseCase implements UseCase<Either,UserSignInReq> {

  @override
  Future<Either> call({UserSignInReq? params}) async {
    return await s1<AuthRepository>().signIn(params!);
  }

}