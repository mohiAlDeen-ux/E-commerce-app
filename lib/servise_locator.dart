import 'package:flutter_application_1/data/auth/repository/auth.dart';
import 'package:flutter_application_1/data/auth/src/auth_api_service.dart';
import 'package:flutter_application_1/data/auth/src/auth_local_service.dart';
import 'package:flutter_application_1/data/categories/repository/categories.dart';
import 'package:flutter_application_1/data/categories/src/categories_api_service.dart';
import 'package:flutter_application_1/data/preferences/repository/preferences.dart';
import 'package:flutter_application_1/data/preferences/src/preferences_local_services.dart';
import 'package:flutter_application_1/data/products/repository/products.dart';
import 'package:flutter_application_1/data/products/src/products_api_services.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/domain/auth/usecase/confirm_verification_code.dart';
import 'package:flutter_application_1/domain/auth/usecase/get_user_usecase.dart';
import 'package:flutter_application_1/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:flutter_application_1/domain/auth/usecase/reset_password_py_old_password.dart';
import 'package:flutter_application_1/domain/auth/usecase/sent_verification_code_usecase.dart';
import 'package:flutter_application_1/domain/auth/usecase/reset_password_py_token.dart';
import 'package:flutter_application_1/domain/auth/usecase/signin_usecase.dart';
import 'package:flutter_application_1/domain/auth/usecase/signup_usecase.dart';
import 'package:flutter_application_1/domain/categories/repository/category.dart';
import 'package:flutter_application_1/domain/categories/usecase/get_categories_usecase.dart';
import 'package:flutter_application_1/domain/preferences/repository/preferences.dart';
import 'package:flutter_application_1/domain/preferences/usecase/is_first_time_usecase.dart';
import 'package:flutter_application_1/domain/preferences/usecase/set_first_time_usecase.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/domain/product/usecase/add_product_to_bookmark_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_bookmarked_products_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_familiar_product_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_popular_products_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_product_py_id_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_products_py_category_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/get_top_seling_products_usecase.dart';
import 'package:flutter_application_1/domain/product/usecase/remove_product_from_bookmark_usecase.dart';

import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator(){

  //service
  getIt.registerSingleton<AuthApiService>(AuthApiServiceImp());

  getIt.registerSingleton<AuthLocalService>(AuthLocalServiceImp());

  getIt.registerSingleton<CategoriesApiService>(CategoriesApiServiceImp());

  getIt.registerSingleton<ProductsApiServices>(ProductsApiServicesImp());

  getIt.registerSingleton<PreferencesLocalServices>(PreferencesLocalServicesImp());


  //repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImp());

  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImp());

  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImp());

  getIt.registerSingleton<PreferencesRepository>(PreferencesRepositoryImp());


  //usecase
  getIt.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());

  getIt.registerSingleton<GetUserUsecase>(GetUserUsecase());

  getIt.registerSingleton<SigninUsecase>(SigninUsecase());

  getIt.registerSingleton<SignupUsecase>(SignupUsecase());

  getIt.registerSingleton<SentVerificationCodeUsecase>(SentVerificationCodeUsecase());

  getIt.registerSingleton<ConfirmVerificationCodeUsecase>(ConfirmVerificationCodeUsecase());

  getIt.registerSingleton<ResetPasswordPyTokenUseCase>(ResetPasswordPyTokenUseCase());

  getIt.registerSingleton<ResetPasswordPyOldPasswordUseCase>(ResetPasswordPyOldPasswordUseCase());

  getIt.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

  getIt.registerSingleton<IsFirstTimeUsecase>(IsFirstTimeUsecase());

  getIt.registerSingleton<SetFirstTimeUsecase>(SetFirstTimeUsecase());

  getIt.registerSingleton<GetPopularProductsUsecase>(GetPopularProductsUsecase());

  getIt.registerSingleton<GetProductPyIdUsecase>(GetProductPyIdUsecase());

  getIt.registerSingleton<GetFamiliarProductUsecase>(GetFamiliarProductUsecase());

  getIt.registerSingleton<AddProductToBookmarkUsecase>(AddProductToBookmarkUsecase());

  getIt.registerSingleton<RemoveProductFromBookmarkUsecase>(RemoveProductFromBookmarkUsecase());
  
  getIt.registerSingleton<GetBookmarkedProductsUsecase>(GetBookmarkedProductsUsecase());

  getIt.registerSingleton<GetTopSelingProductsUsecase>(GetTopSelingProductsUsecase());

  getIt.registerSingleton<GetProductsPyCategoryUsecase>(GetProductsPyCategoryUsecase());


}