import '../../../../common/bloc/product_list_with_pagination_and_cache/product_list_cubit.dart';
import '../../../../domain/product/usecase/get_cached_popular_products_usecase.dart';
import '../../../../domain/product/usecase/get_popular_products_usecase.dart';
import '../../../../servise_locator.dart';

class PopularProductCubit extends ProductsCubit {
  PopularProductCubit() : super(
    getServerProductUsecase: getIt.call<GetPopularProductsUsecase>(),
    getCacheProductUsecase:  getIt.call<GetCachedPopularProductsUsecase>()
  );
  
}