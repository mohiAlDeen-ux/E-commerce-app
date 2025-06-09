import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../servise_locator.dart';

class GetCartUsecase extends UseCase<Either<String,CartEntity>,dynamic> {  
  @override
  Future<Either<String,CartEntity>> call({params}) async{
    return getIt.call<CartRepository>().getCart();
  }
}
