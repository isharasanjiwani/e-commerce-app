import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/bloc/button/button_state_cubit.dart';
import 'package:flutter_project/common/widget/appbar/app_bar.dart';
import 'package:flutter_project/common/widget/button/basic_reactive_button.dart';
import 'package:flutter_project/domain/auth/usecases/send_password_reset_email.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController emailCon =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: true,),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _signInText(context),
              const SizedBox(height: 20,),
              _emailField(context),
              const SizedBox(height: 20,),
              _continueButton(),
              const SizedBox(height: 20,)
            ],
          ),
        )
      ),
    );
  }

  Widget _signInText(BuildContext context){
    return const Text(
      'Forgot Password',
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _emailField(BuildContext context){
    return TextField(
      controller: emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
    );
  }

  Widget _continueButton() {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: (){
            context.read<ButtonStateCubit>().execute(
              useCase: SendPasswordResetEmailUseCase(),
              params: emailCon.text
            );
          },
          title: 'Continue',
        );
      }
    );
  }

}
