import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(DisplaySplash());

  void appStated() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticated());
  }
}