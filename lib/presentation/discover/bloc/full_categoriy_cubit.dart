import '../../../domain/categories/usecase/get_full_categories_usecase.dart';
import '../../../servise_locator.dart';

import '../../../common/bloc/task/task_cubit.dart';

class FullCategoriyCubit extends TaskCubit{
  void getCategories(){
    execute(getIt.call<GetFullCategoriesUsecase>());
  }
}