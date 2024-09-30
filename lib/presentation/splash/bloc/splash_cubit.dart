import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_project/presentation/splash/bloc/splash_state.dart';

import '../../../service_locator.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(DisplaySplash());

  void appStated() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await s1<IsLoggedInUseCase>().call();
    if(isLoggedIn){
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}