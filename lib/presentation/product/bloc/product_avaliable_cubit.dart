import 'package:flutter_application_1/common/bloc/task/task_cubit.dart';
import 'package:flutter_application_1/domain/product/usecase/is_avaliable_usecase.dart';

class ProductAvaliableCubit extends TaskCubit{

  Future<void> isAvaliable(String id) async {
    execute(IsAvaliableUsecase(),id);
  }
}