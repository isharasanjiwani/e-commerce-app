import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/bloc/categories/categories_display_state.dart';
import 'package:flutter_project/domain/category/usecases/get_categories.dart';

import '../../../service_locator.dart';

class CategoryDisplayCubit extends Cubit<CategoriesDisplayState> {

  CategoryDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await s1<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error){
        emit(LoadCategoriesFailure());
        },
      (data){
        emit(CategoriesLoaded(categories: data));
      }
    );
  }

}