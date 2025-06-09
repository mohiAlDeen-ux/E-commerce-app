part of 'cart_bloc.dart';


abstract class CartState {
  final CartEntity? cart;
  final Set<String> loadingOperations;
  final Map<String, String> operationTypes;
  
  const CartState({
    required this.cart,
    this.loadingOperations = const {},
    this.operationTypes = const {},
  });
  
  bool get isLoading => loadingOperations.isNotEmpty;
  bool get hasCartData => cart != null;
}

class CartInitial extends CartState {
  const CartInitial() : super(cart: null);
}

class CartLoading extends CartState {
  const CartLoading({super.cart});
}

class CartLoaded extends CartState {
  const CartLoaded(CartEntity cart) : super(cart: cart);
}

class CartOperationInProgress extends CartState {
  const CartOperationInProgress({
    required CartEntity super.cart,
    required super.loadingOperations,
    required super.operationTypes,
  });
}

class CartOperationSuccess extends CartState {
  const CartOperationSuccess(CartEntity cart) : super(cart: cart);
}

class CartError extends CartState {
  final String message;
  
  const CartError(this.message, {required super.cart});
}

class CartCheckoutInProgress extends CartState {
  const CartCheckoutInProgress({required CartEntity cart}) 
      : super(cart: cart);
}

class CartCheckoutSuccess extends CartState {
  final String orderId;
  
  const CartCheckoutSuccess({
    required this.orderId,
    required CartEntity cart,
  }) : super(cart: cart);
}

class CartCheckoutFailure extends CartState {
  final String message;
  
  const CartCheckoutFailure({
    required this.message,
    required CartEntity cart,
  }) : super(cart: cart);
}

class CartStreamErrorState extends CartState {
  final String error;
  
  const CartStreamErrorState({
    required this.error,
    required CartEntity super.cart,
    required super.loadingOperations,
    required super.operationTypes,
  });
}

extension CartStateCopyWith on CartState {
  CartState copyWith({
    CartEntity? cart,
    Set<String>? loadingOperations,
    Map<String, String>? operationTypes,
  }) {
    return switch (this) {
      CartInitial() => const CartInitial(),
      CartLoading() => CartLoading(cart: cart ?? this.cart),
      CartLoaded() => CartLoaded(cart ?? this.cart!),
      CartOperationInProgress() => CartOperationInProgress(
          cart: cart ?? this.cart!,
          loadingOperations: loadingOperations ?? this.loadingOperations,
          operationTypes: operationTypes ?? this.operationTypes,
        ),
      CartOperationSuccess() => CartOperationSuccess(cart ?? this.cart!),
      CartError(:final message) => CartError(
          message,
          cart: cart ?? this.cart,
        ),
      CartCheckoutInProgress() => CartCheckoutInProgress(
          cart: cart ?? this.cart!,
        ),
      CartCheckoutSuccess(:final orderId) => CartCheckoutSuccess(
          orderId: orderId,
          cart: cart ?? this.cart!,
        ),
      CartCheckoutFailure(:final message) => CartCheckoutFailure(
          message: message,
          cart: cart ?? this.cart!,
        ),
      CartStreamErrorState(:final error) => CartStreamErrorState(
          error: error,
          cart: cart ?? this.cart!,
          loadingOperations: loadingOperations ?? this.loadingOperations,
          operationTypes: operationTypes ?? this.operationTypes,
        ),
      _ => throw StateError('Unknown state type'),
    };
  }
}