import 'package:dartz/dartz.dart';
import 'package:flutter_project/data/auth/models/user_creation_req.dart';

import '../../../data/auth/models/user_sign_in_req.dart';

abstract class AuthRepository{
  Future<Either> signup(UserCreationReq user);
  Future<Either> signIn(UserSignInReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLogged();
  Future<Either> getUser();
}