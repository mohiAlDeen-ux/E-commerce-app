import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/cart/models/update_cart_item_req.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';


abstract class CartRepository {
  Stream<Either<String, CartEntity>> watchCart();
  Future<Either<String, CartEntity>> getCart();
  Future<Either> addCartItem(CartItemEntity item);
  Future<Either> removeItem(String itemId);
  Future<Either> updateItem(UpdateCartItemReq updateCartItemReq);
  Future<Either> clearCart();
  Future<Either> placeOrder();
}
