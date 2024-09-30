import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/domain/auth/usecases/get_user.dart';
import 'package:flutter_project/presentation/home/bloc/user_info_display_state.dart';

import '../../../service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {

  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await s1<GetUserUseCase>().call();
    returnedData.fold(
        (error){
          emit(LoadUserInfoFailure());
        },
        (data){
          emit(UserInfoLoaded(
            user: data
          ));
        }
    );
  }
}