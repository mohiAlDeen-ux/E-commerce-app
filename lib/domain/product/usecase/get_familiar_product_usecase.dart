import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/servise_locator.dart';

class GetFamiliarProductUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) {
    return getIt.call<ProductsRepository>().getFamiliarProduct(params);
  }
  
}