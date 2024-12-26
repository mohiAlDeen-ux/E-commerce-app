import 'package:flutter_application_1/common/bloc/task/task_cubit.dart';
import 'package:flutter_application_1/domain/product/usecase/get_popular_products_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

class PopularProductCubit extends TaskCubit{

  Future<void> getPopularProducts() async{
    execute(GetPopularProductsUsecase());
  }
}