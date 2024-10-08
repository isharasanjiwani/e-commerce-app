import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/helper/navigator/app_navigator.dart';
import 'package:flutter_project/core/configs/assets/app_vectors.dart';
import 'package:flutter_project/core/configs/theme/app_colors.dart';
import 'package:flutter_project/presentation/auth/pages/sign_in.dart';
import 'package:flutter_project/presentation/splash/bloc/splash_cubit.dart';
import 'package:flutter_project/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/pages/home.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SignInPage());
        } else if (state is Authenticated){
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo
          ),
        ),
      )
    );
  }
}
