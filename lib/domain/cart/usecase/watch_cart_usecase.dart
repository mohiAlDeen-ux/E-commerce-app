import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usecase/stream_usecase.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/servise_locator.dart';

class WatchCartUsecase extends StreamUsecase<Either<String, CartEntity>,dynamic>{
  @override
  Stream<Either<String, CartEntity>> call({params}){
    return getIt.call<CartRepository>().watchCart();
  }
}