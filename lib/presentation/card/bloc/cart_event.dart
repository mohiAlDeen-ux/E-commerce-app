part of 'cart_bloc.dart';

sealed class CartEvent {}

final class LoadCart extends CartEvent {}

final class CartStreamUpdated extends CartEvent {
  final CartEntity cart;

  CartStreamUpdated(this.cart);
}

final class CartStreamError extends CartEvent {
  final String error;

  CartStreamError(this.error);
}

final class AddItemToCart extends CartEvent {
  final CartItemEntity cartItem;

  AddItemToCart(this.cartItem);
}

final class RemoveItemFromCart extends CartEvent {
  final String cartId;

  RemoveItemFromCart(this.cartId);
}

final class UpdateCartItem extends CartEvent {
  final String cartId;
  final CartItemEntity cartItem;

  UpdateCartItem(this.cartId, this.cartItem);
}

final class ClearCart extends CartEvent {}

final class CheckoutCart extends CartEvent {}

final class OperationStarted extends CartEvent {
  final String operationId;
  final String operationType;

  OperationStarted(this.operationId, this.operationType);
}

final class OperationCompleted extends CartEvent {
  final String operationId;

  OperationCompleted(this.operationId);
}