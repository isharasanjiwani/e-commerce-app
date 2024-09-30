import 'package:dartz/dartz.dart';
import 'package:flutter_project/data/auth/models/user_creation_req.dart';
import 'package:flutter_project/data/auth/models/user_sign_in_req.dart';
import 'package:flutter_project/data/auth/source/auth_firebase_service.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';
import '../models/user.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signup(UserCreationReq user) async {
    return s1<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await s1<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSignInReq user) async{
    return await s1<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await s1<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLogged() async {
    return await s1<AuthFirebaseService>().isLogged();
  }

  @override
  Future<Either> getUser() async {
    var user = await s1<AuthFirebaseService>().getUser();
    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          UserModel.fromMap(data).toEntity()
        );
      }
    );
  }

}