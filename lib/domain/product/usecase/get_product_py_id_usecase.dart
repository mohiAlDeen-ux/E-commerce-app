import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:dartz/dartz.dart';

class GetProductPyIdUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) async{
    return await getIt.call<ProductsRepository>().getProductPyId(params);
  }
}