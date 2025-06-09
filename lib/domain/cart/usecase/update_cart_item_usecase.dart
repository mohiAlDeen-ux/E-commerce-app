import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/data/cart/models/update_cart_item_req.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/servise_locator.dart';

class UpdateCartItemUsecase extends UseCase<Either,UpdateCartItemReq> {  
  @override
  Future<Either> call({UpdateCartItemReq? params}) async{
    return getIt.call<CartRepository>().updateItem(params!);
  }
}