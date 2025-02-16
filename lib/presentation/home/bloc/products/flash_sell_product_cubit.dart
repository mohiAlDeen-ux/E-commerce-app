import 'package:flutter_application_1/common/bloc/product_list_with_pagination_and_cache/product_list_cubit.dart';
import 'package:flutter_application_1/domain/product/usecase/get_cached_flash_sell_products_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_flash_seling_product_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

class FlashSellProductCubit extends ProductsCubit {
  FlashSellProductCubit() : super(
    getServerProductUsecase: getIt.call<GetFlashSellProductsUsecase>(),
    getCacheProductUsecase:  getIt.call<GetCachedFlashSellProductsUsecase>()
  );
  
}