import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../servise_locator.dart';

class AddCartItemUsecase extends UseCase<Either,CartItemEntity> {  
  @override
  Future<Either> call({CartItemEntity? params}) async{
    return getIt.call<CartRepository>().addCartItem(params!);
  }
}
