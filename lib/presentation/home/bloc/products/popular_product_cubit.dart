import '../../../../common/bloc/task/task_cubit.dart';
import '../../../../domain/product/usecase/get_popular_products_usecase.dart';
import '../../../../servise_locator.dart';

class PopularProductCubit extends TaskCubit{

  Future<void> getPopularProducts() async{
    execute(GetPopularProductsUsecase());
  }
}