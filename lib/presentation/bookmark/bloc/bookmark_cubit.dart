import 'package:flutter_application_1/common/bloc/task/task_cubit.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/domain/product/usecase/get_bookmarked_products_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

class BookMarkCubit extends TaskCubit{

  Future<void> getBookmarkedProducts()async{
    await execute(GetBookmarkedProductsUsecase());
  }
}