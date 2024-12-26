import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/servise_locator.dart';

class GetPopularProductsUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await getIt.call<ProductsRepository>().getPopularProducts();
  }

}