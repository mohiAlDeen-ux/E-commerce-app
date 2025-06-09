import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';

class UpdateCartItemReq {
  final String cartId;
  final CartItemEntity cartEntity;

  UpdateCartItemReq({required this.cartId, required this.cartEntity});
}
