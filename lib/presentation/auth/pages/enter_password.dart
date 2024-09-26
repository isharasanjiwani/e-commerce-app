import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/bloc/button/button_state_cubit.dart';
import 'package:flutter_project/common/helper/navigator/app_navigator.dart';
import 'package:flutter_project/common/widget/appbar/app_bar.dart';
import 'package:flutter_project/common/widget/button/basic_reactive_button.dart';
import 'package:flutter_project/data/auth/models/user_sign_in_req.dart';
import 'package:flutter_project/domain/auth/usecases/sign_in.dart';
import 'package:flutter_project/presentation/auth/pages/forgot_password.dart';
import 'package:flutter_project/presentation/auth/pages/password_reset_email_page.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/widget/button/basic_app_button.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSignInReq userSignInReq;

  EnterPasswordPage({
    super.key,
    required this.userSignInReq
  });

  final TextEditingController passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if(state is ButtonFailureState){
                var snackBar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if(state is ButtonFailureState){
                  var snackBar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if(state is ButtonSuccessState){
                  AppNavigator.pushReplacement(context, const PasswordResetEmailPage());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _signInText(context),
                  const SizedBox(height: 20,),
                  _passwordField(context),
                  const SizedBox(height: 20,),
                  _continueButton(context),
                  const SizedBox(height: 20,),
                  _forgotPassword(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context){
    return const Text(
      'Sign in',
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _passwordField(BuildContext context){
    return TextField(
      controller: passwordCon,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: (){
            userSignInReq.password = passwordCon.text;
            context.read<ButtonStateCubit>().execute(
              useCase: SignInUseCase(),
              params: userSignInReq
            );
          },
          title: 'Continue',
        );
      }
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            const TextSpan(
                text: 'Forgot Password?'
            ),
            TextSpan(
                text: 'Reset',
                recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.push(context, ForgotPasswordPage());
                },
                style: const TextStyle(
                    fontWeight: FontWeight.bold
                )
            )
          ]
      ),
    );
  }
}
