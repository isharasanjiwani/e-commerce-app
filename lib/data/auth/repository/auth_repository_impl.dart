import 'package:dartz/dartz.dart';
import 'package:flutter_project/data/auth/models/user_creation_req.dart';
import 'package:flutter_project/data/auth/source/auth_firebase_service.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signup(UserCreationReq user) async {
    return s1<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() {
    return s1<AuthFirebaseService>().getAges();
  }


  
}