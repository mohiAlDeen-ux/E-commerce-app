import 'package:flutter_application_1/domain/categories/usecase/get_full_categories_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

import 'package:flutter_application_1/common/bloc/task/task_cubit.dart';

class FullCategoriyCubit extends TaskCubit{
  void getCategories(){
    execute(getIt.call<GetFullCategoriesUsecase>());
  }
}