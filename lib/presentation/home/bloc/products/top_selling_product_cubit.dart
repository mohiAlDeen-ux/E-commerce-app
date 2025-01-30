import '../../../../common/bloc/task/task_cubit.dart';
import '../../../../domain/product/usecase/get_top_seling_products_usecase.dart';
class TopSellingProductCubit extends TaskCubit{

  Future<void> getTopSellingProducts() async{
    execute(GetTopSelingProductsUsecase());
  }
}