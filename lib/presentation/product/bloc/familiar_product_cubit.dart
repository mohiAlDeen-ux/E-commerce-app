import 'package:flutter_application_1/common/bloc/task/task_cubit.dart';
import 'package:flutter_application_1/domain/product/usecase/get_familiar_product_usecase.dart';

class FamiliarProductCubit extends TaskCubit{
  
  Future<void> getFamiliarProduct(String id) async{
    execute(GetFamiliarProductUsecase(), id);
  }
}