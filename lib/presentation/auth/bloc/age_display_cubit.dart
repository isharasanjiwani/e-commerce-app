import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/auth/usecases/get_ages.dart';
import '../../../service_locator.dart';
import 'age_display_states.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayStates> {
  AgeDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnData = await s1<GetAgesUseCase>().call();

    returnData.fold(
      (message) {
        emit(AgesLoadFailure(message: message));
      },
      (data) {
        emit(AgesLoaded(ages: data));
      }
    );
  }
}