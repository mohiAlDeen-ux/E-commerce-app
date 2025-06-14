import 'package:flutter_application_1/data/auth/src/cloudinary_server.dart';
import 'package:flutter_application_1/data/cart/repository/cart.dart';
import 'package:flutter_application_1/data/cart/src/cart_api_servises.dart';
import 'package:flutter_application_1/domain/auth/usecase/log_out_usecase.dart';
import 'package:flutter_application_1/domain/auth/usecase/send_password_reset_email_usecase.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/domain/cart/usecase/add_cart_item_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/clear_cart_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/get_cart_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/place_order_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/update_cart_item_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/watch_cart_usecase.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';

import 'data/products/src/products_cache_services.dart';
import 'domain/categories/usecase/get_full_categories_usecase.dart';
import 'domain/preferences/usecase/get_language_usecase.dart';
import 'domain/preferences/usecase/set_language_usecase.dart';
import 'domain/product/usecase/get_cached_familiar_product_usecase.dart';
import 'domain/product/usecase/get_cached_flash_sell_products_usecase.dart';
import 'domain/product/usecase/get_cached_paying_information_usecase.dart';
import 'domain/product/usecase/get_cached_popular_products_usecase.dart';
import 'domain/product/usecase/get_cached_rating_information_usecase.dart';
import 'domain/product/usecase/get_cached_top_selling_products_usecase.dart';
import 'domain/product/usecase/get_flash_seling_product_usecase.dart';
import 'domain/product/usecase/get_product_pying_information_usecase.dart';
import 'domain/product/usecase/is_have_enough_data_in_cache_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/auth/usecase/set_user_info_usecase.dart';

import 'data/auth/repository/auth.dart';
import 'data/auth/src/auth_api_service.dart';
import 'data/categories/repository/categories.dart';
import 'data/categories/src/categories_api_service.dart';
import 'data/preferences/repository/preferences.dart';
import 'data/preferences/src/preferences_local_services.dart';
import 'data/products/repository/products.dart';
import 'data/products/src/products_api_services.dart';
import 'domain/auth/repository/auth.dart';
import 'domain/auth/usecase/get_user_usecase.dart';
import 'domain/auth/usecase/is_logged_in_usecase.dart';
import 'domain/auth/usecase/reset_password_py_old_password.dart';
import 'domain/auth/usecase/signin_usecase.dart';
import 'domain/auth/usecase/signup_usecase.dart';
import 'domain/categories/repository/category.dart';
import 'domain/categories/usecase/get_categories_usecase.dart';
import 'domain/preferences/repository/preferences.dart';
import 'domain/preferences/usecase/is_first_time_usecase.dart';
import 'domain/preferences/usecase/set_first_time_usecase.dart';
import 'domain/product/repository/products.dart';
import 'domain/product/usecase/add_product_to_bookmark_usecase.dart';
import 'domain/product/usecase/get_bookmarked_products_usecase.dart';
import 'domain/product/usecase/get_familiar_product_usecase.dart';
import 'domain/product/usecase/get_popular_products_usecase.dart';
import 'domain/product/usecase/get_product_rating_information_usecase.dart';
import 'domain/product/usecase/get_products_py_category_usecase.dart';
import 'domain/product/usecase/get_top_seling_products_usecase.dart';
import 'domain/product/usecase/remove_product_from_bookmark_usecase.dart';
import 'domain/cart/usecase/remove_cart_item_usecase.dart';

import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async{
  // helper
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  //service
  getIt.registerSingleton<AuthApiService>(AuthApiServiceImp());

  getIt.registerSingleton<CategoriesApiService>(CategoriesApiServiceImp());

  getIt.registerSingleton<ProductsApiServices>(ProductsApiServicesImp());

  getIt.registerSingleton<PreferencesLocalServices>(PreferencesLocalServicesImp());

  getIt.registerSingleton<ProductsCacheServices>(ProductsCacheServicesImp());

  getIt.registerSingleton<CartApiServises>(CartApiServisesImp());


  //repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImp());

  getIt.registerSingleton<CloudinaryService>(CloudinaryServiceImp());

  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImp());

  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImp());

  getIt.registerSingleton<PreferencesRepository>(PreferencesRepositoryImp());

  getIt.registerSingleton<CartRepository>(CartRepositoryImp());


  //usecase
  getIt.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());

  getIt.registerSingleton<GetUserUsecase>(GetUserUsecase());

  getIt.registerSingleton<SigninUsecase>(SigninUsecase());

  getIt.registerSingleton<SignupUsecase>(SignupUsecase());

  getIt.registerSingleton<ResetPasswordPyOldPasswordUseCase>(ResetPasswordPyOldPasswordUseCase());

  getIt.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

  getIt.registerSingleton<IsFirstTimeUsecase>(IsFirstTimeUsecase());

  getIt.registerSingleton<SetFirstTimeUsecase>(SetFirstTimeUsecase());

  getIt.registerSingleton<GetPopularProductsUsecase>(GetPopularProductsUsecase());

  getIt.registerSingleton<GetProductRatingInformationUsecase>(GetProductRatingInformationUsecase());

  getIt.registerSingleton<GetFamiliarProductUsecase>(GetFamiliarProductUsecase());

  getIt.registerSingleton<AddProductToBookmarkUsecase>(AddProductToBookmarkUsecase());

  getIt.registerSingleton<RemoveProductFromBookmarkUsecase>(RemoveProductFromBookmarkUsecase());
  
  getIt.registerSingleton<GetBookmarkedProductsUsecase>(GetBookmarkedProductsUsecase());

  getIt.registerSingleton<GetTopSelingProductsUsecase>(GetTopSelingProductsUsecase());

  getIt.registerSingleton<GetFlashSellProductsUsecase>(GetFlashSellProductsUsecase());

  getIt.registerSingleton<GetProductsPyCategoryUsecase>(GetProductsPyCategoryUsecase());

  getIt.registerSingleton<SetUserInfoUsecase>(SetUserInfoUsecase());

  getIt.registerSingleton<GetFullCategoriesUsecase>(GetFullCategoriesUsecase());

  getIt.registerSingleton<SetLanguageUsecase>(SetLanguageUsecase());

  getIt.registerSingleton<GetLanguageUsecase>(GetLanguageUsecase());

  getIt.registerSingleton<GetProductPayingInformationUsecase>(GetProductPayingInformationUsecase());

  getIt.registerSingleton<GetCachedTopSellingProductsUsecase>(GetCachedTopSellingProductsUsecase());

  getIt.registerSingleton<GetCachedPopularProductsUsecase>(GetCachedPopularProductsUsecase());

  getIt.registerSingleton<GetCachedRatingInformationUsecase>(GetCachedRatingInformationUsecase());

  getIt.registerSingleton<GetCachedPayingInformationUsecase>(GetCachedPayingInformationUsecase());

  getIt.registerSingleton<GetCachedFlashSellProductsUsecase>(GetCachedFlashSellProductsUsecase());

  getIt.registerSingleton<IsHaveEnoughDataInCacheUsecase>(IsHaveEnoughDataInCacheUsecase());

  getIt.registerSingleton<GetCachedFamiliarProductUsecase>(GetCachedFamiliarProductUsecase());

  getIt.registerSingleton<GetCartUsecase>(GetCartUsecase());

  getIt.registerSingleton<WatchCartUsecase>(WatchCartUsecase());

  getIt.registerSingleton<AddCartItemUsecase>(AddCartItemUsecase());

  getIt.registerSingleton<ClearCartUsecase>(ClearCartUsecase());

  getIt.registerSingleton<PlaceOrderUsecase>(PlaceOrderUsecase());

  getIt.registerSingleton<RemoveCartItemUsecase>(RemoveCartItemUsecase());

  getIt.registerSingleton<UpdateCartItemUsecase>(UpdateCartItemUsecase());

  getIt.registerSingleton<LogOutUsecase>(LogOutUsecase());

  getIt.registerSingleton<SendPasswordResetEmailUsecase>(SendPasswordResetEmailUsecase());



}
