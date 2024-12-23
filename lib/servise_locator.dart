import 'package:flutter_application_1/data/auth/repository/auth.dart';
import 'package:flutter_application_1/data/auth/src/auth_api_service.dart';
import 'package:flutter_application_1/data/auth/src/auth_local_service.dart';
import 'package:flutter_application_1/data/categories/repository/categories.dart';
import 'package:flutter_application_1/data/categories/src/categories_api_service.dart';
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
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/presentation/home/widget/categories.dart';

import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator(){

  //service
  getIt.registerSingleton<AuthApiService>(AuthApiServiceImp());

  getIt.registerSingleton<AuthLocalService>(AuthLocalServiceImp());

  getIt.registerSingleton<CategoriesApiService>(CategoriesApiServiceImp());

  getIt.registerSingleton<ProductsApiServices>(ProductsApiServicesImp());


  //repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImp());

  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImp());

  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImp());


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
  

}