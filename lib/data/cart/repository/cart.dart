import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/auth/src/auth_api_service.dart';
import 'package:flutter_application_1/data/cart/models/cart_models.dart';
import 'package:flutter_application_1/data/cart/models/update_cart_item_req.dart';
import 'package:flutter_application_1/data/cart/src/cart_api_servises.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/servise_locator.dart';

class CartRepositoryImp extends CartRepository {
  @override
  Future<Either> addCartItem(CartItemEntity item) {
    // TODO: implement addCartItem
    throw UnimplementedError();
  }


  @override
  Future<Either> clearCart() {
    // TODO: implement clearCart
    throw UnimplementedError();
  }

  @override
  Future<Either<String, CartEntity>> getCart() async {
   return (await getIt.call<CartApiServises>().getCartItems()).fold((error){
    return Left(error);
   }, (CartModels data){
    return Right(data.toEntity());
   });
  }

  @override
  Future<Either> removeItem(String itemId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }


  @override
  Stream<Either<String, CartEntity>> watchCart() {
    // TODO: implement watchCart
    throw UnimplementedError();
  }
  
  @override
  Future<Either> placeOrder() async{
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }
  
  @override
  Future<Either> updateItem(UpdateCartItemReq updateCartItemReq) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
