import 'package:flutter_project/data/auth/repository/auth_repository_impl.dart';
import 'package:flutter_project/data/auth/source/auth_firebase_service.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';
import 'package:flutter_project/domain/auth/usecases/get_ages.dart';
import 'package:flutter_project/domain/auth/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services

  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //Repositories;
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Use cases
  s1.registerSingleton<SignupUseCase>(SignupUseCase());
  s1.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
}