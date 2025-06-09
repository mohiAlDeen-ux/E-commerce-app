import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/servise_locator.dart';

class PlaceOrderUsecase extends UseCase<Either,dynamic> {  
  @override
  Future<Either> call({params}) async{
    return getIt.call<CartRepository>().placeOrder();
  }
}