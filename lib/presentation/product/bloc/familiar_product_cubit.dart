import '../../../common/bloc/task/task_cubit.dart';
import '../../../domain/product/usecase/get_familiar_product_usecase.dart';

class FamiliarProductCubit extends TaskCubit{
  
  Future<void> getFamiliarProduct(String id) async{
    execute(GetFamiliarProductUsecase(), id);
  }
}