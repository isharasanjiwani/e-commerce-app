import 'package:flutter_project/data/auth/repository/auth_repository_impl.dart';
import 'package:flutter_project/data/auth/source/auth_firebase_service.dart';
import 'package:flutter_project/data/category/repository/category_repository_impl.dart';
import 'package:flutter_project/data/category/source/category_firebase_service.dart';
import 'package:flutter_project/domain/auth/repository/auth.dart';
import 'package:flutter_project/domain/auth/usecases/get_ages.dart';
import 'package:flutter_project/domain/auth/usecases/get_user.dart';
import 'package:flutter_project/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_project/domain/auth/usecases/send_password_reset_email.dart';
import 'package:flutter_project/domain/auth/usecases/sign_in.dart';
import 'package:flutter_project/domain/auth/usecases/signup.dart';
import 'package:flutter_project/domain/category/repository/category.dart';
import 'package:flutter_project/domain/category/usecases/get_categories.dart';
import 'package:flutter_project/domain/product/usecases/get_top_selling.dart';
import 'package:get_it/get_it.dart';

import 'data/product/repository/product.dart';
import 'data/product/source/product_firebase_service.dart';
import 'domain/product/repository/product.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services

  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  s1.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  s1.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  //Repositories;
  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  s1.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  s1.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  //Use cases
  s1.registerSingleton<SignupUseCase>(SignupUseCase());
  s1.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  s1.registerSingleton<SignInUseCase>(SignInUseCase());
  s1.registerSingleton<SendPasswordResetEmailUseCase>(SendPasswordResetEmailUseCase());
  s1.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  s1.registerSingleton<GetUserUseCase>(GetUserUseCase());

  s1.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  s1.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());

}