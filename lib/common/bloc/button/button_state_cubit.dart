import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/bloc/button/button_state.dart';

import '../../../core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState>{
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase useCase}) async {
    emit(ButtonLoadingState());
    try{
      Either returnedData = await useCase.call(params: params);
      returnedData.fold(
          (error) {
            emit(ButtonFailureState(errorMessage: error));
          },
          (data) {
            emit(ButtonSuccessState());
          }
      );
    } catch(e){
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}