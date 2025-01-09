import '../../../common/bloc/task/task_cubit.dart';
import '../../../domain/product/repository/products.dart';
import '../../../domain/product/usecase/get_bookmarked_products_usecase.dart';
import '../../../servise_locator.dart';

class BookMarkCubit extends TaskCubit{

  Future<void> getBookmarkedProducts()async{
    await execute(GetBookmarkedProductsUsecase());
  }
}