import 'package:flutter_application_1/common/bloc/product_list_with_pagination_and_cache/product_list_cubit.dart';
import 'package:flutter_application_1/domain/product/usecase/get_cached_top_selling_products_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_top_seling_products_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

class TopSellingProductCubit extends ProductsCubit {
  TopSellingProductCubit() : super(
    getServerProductUsecase: getIt.call<GetTopSelingProductsUsecase>(),
    getCacheProductUsecase:  getIt.call<GetCachedTopSellingProductsUsecase>()
  );
  
}