import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/servise_locator.dart';

class RemoveCartItemUsecase extends UseCase<Either,String> {  
  @override
  Future<Either> call({String? params}) async{
    return getIt.call<CartRepository>().removeItem(params!);
  }
}