import '../../../common/bloc/task/task_cubit.dart';
import '../../../domain/product/usecase/get_product_py_id_usecase.dart';

class ProductCubit extends TaskCubit{

  Future<void> getProduct(String id) async{
    execute(GetProductPyIdUsecase(), id);
  }
}