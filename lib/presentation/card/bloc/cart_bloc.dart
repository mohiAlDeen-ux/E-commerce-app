import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/cart/models/update_cart_item_req.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';
import 'package:flutter_application_1/domain/cart/repository/cart.dart';
import 'package:flutter_application_1/domain/cart/usecase/add_cart_item_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/clear_cart_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/get_cart_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/place_order_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/remove_cart_item_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/update_cart_item_usecase.dart';
import 'package:flutter_application_1/domain/cart/usecase/watch_cart_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  StreamSubscription<Either<String, CartEntity>>? _cartSubscription;
  bool _hasInitialSnapshot = false;

  CartBloc() : super(const CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<CartStreamUpdated>(_onCartStreamUpdated);
    on<CartStreamError>(_onCartStreamError);
    on<AddItemToCart>(_onAddItemToCart);
    on<RemoveItemFromCart>(_onRemoveItemFromCart);
    on<UpdateCartItem>(_onUpdateCartItem);
    on<ClearCart>(_onClearCart);
    on<CheckoutCart>(_onCheckoutCart);
    on<OperationStarted>(_onOperationStarted);
    on<OperationCompleted>(_onOperationCompleted);



  }

  Future<void> _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading(cart: state.cart));

    try {
      final snapshotResult = await getIt.call<GetCartUsecase>().call();

      snapshotResult.fold(
        (error) => emit(CartError(error, cart: state.cart)),
        (cart) {
          emit(CartLoaded(cart));
          _hasInitialSnapshot = true;
          //_startCartStream(); i not empliment this stream
        },
      );
    } catch (e) {
      emit(CartError('Failed to load cart', cart: state.cart));
    }
  }

  void _startCartStream() {
    _cartSubscription?.cancel();
    _cartSubscription = getIt.call<WatchCartUsecase>().call().listen((either) {
      either.fold(
        (error) => add(CartStreamError(error)),
        (cart) => add(CartStreamUpdated(cart)),
      );
    });
  }

  void _onCartStreamUpdated(
    CartStreamUpdated event,
    Emitter<CartState> emit,
  ) {
    if (!_hasInitialSnapshot) return;

    emit(state.copyWith(cart: event.cart));
  }

  void _onCartStreamError(
    CartStreamError event,
    Emitter<CartState> emit,
  ) {
    if (state.cart != null) {
      emit(CartStreamErrorState(
        error: event.error,
        cart: state.cart!,
        loadingOperations: state.loadingOperations,
        operationTypes: state.operationTypes,
      ));
    } else {
      emit(CartError(event.error, cart: state.cart));
    }
  }

  Future<void> _onAddItemToCart(
    AddItemToCart event,
    Emitter<CartState> emit,
  ) async {
    if (state.cart == null) return;

    const operationType = 'add_item';
    final operationId = '${operationType}_${event.cartItem.id}';

    add(OperationStarted(operationId, operationType));

    final result = await getIt.call<AddCartItemUsecase>().call();

    add(OperationCompleted(operationId));

    result.fold(
      (error) => emit(CartError(error, cart: state.cart)),
      (cart) => emit(CartOperationSuccess(cart)),
    );
  }

  Future<void> _onRemoveItemFromCart(
    RemoveItemFromCart event,
    Emitter<CartState> emit,
  ) async {
    if (state.cart == null) return;

    const operationType = 'remove_item';
    final operationId = '${operationType}_${event.cartId}';

    add(OperationStarted(operationId, operationType));

    final result = await getIt.call<RemoveCartItemUsecase>().call(params: event.cartId);

    add(OperationCompleted(operationId));

    result.fold(
      (error) => emit(CartError(error, cart: state.cart)),
      (cart) => emit(CartOperationSuccess(cart)),
    );
  }

  Future<void> _onUpdateCartItem(
    UpdateCartItem event,
    Emitter<CartState> emit,
  ) async {
    if (state.cart == null) return;

    const operationType = 'update_option';
    final operationId = '${operationType}_${event.cartId}';

    add(OperationStarted(operationId, operationType));

    final result = await getIt.call<UpdateCartItemUsecase>().call(params: UpdateCartItemReq(
      cartId:event.cartId,
      cartEntity: event.cartItem,
    ));

    add(OperationCompleted(operationId));

    result.fold(
      (error) => emit(CartError(error, cart: state.cart)),
      (cart) => emit(CartOperationSuccess(cart)),
    );
  }


  Future<void> _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    if (state.cart == null) return;

    const operationType = 'clear_cart';
    final operationId = operationType;

    add(OperationStarted(operationId, operationType));

    final result = await getIt.call<ClearCartUsecase>().call();

    add(OperationCompleted(operationId));

    result.fold(
      (error) => emit(CartError(error, cart: state.cart)),
      (cart) => emit(CartOperationSuccess(cart)),
    );
  }

  Future<void> _onCheckoutCart(
    CheckoutCart event,
    Emitter<CartState> emit,
  ) async {
    if (state.cart == null) return;

    emit(CartCheckoutInProgress(cart: state.cart!));

    final result = await getIt.call<PlaceOrderUsecase>().call();

    result.fold(
      (error) => emit(CartCheckoutFailure(
        message: error,
        cart: state.cart!,
      )),
      (orderId) => emit(CartCheckoutSuccess(
        orderId: orderId,
        cart: state.cart!,
      )),
    );
  }

  void _onOperationStarted(
    OperationStarted event,
    Emitter<CartState> emit,
  ) {
    final newOperations = {...state.loadingOperations, event.operationId};
    final newOperationTypes = {...state.operationTypes}
      ..[event.operationId] = event.operationType;

    if (state.cart != null) {
      emit(CartOperationInProgress(
        cart: state.cart!,
        loadingOperations: newOperations,
        operationTypes: newOperationTypes,
      ));
    }
  }

  void _onOperationCompleted(
    OperationCompleted event,
    Emitter<CartState> emit,
  ) {
    final newOperations = {...state.loadingOperations}..remove(event.operationId);
    final newOperationTypes = {...state.operationTypes}
      ..remove(event.operationId);

    if (state.cart != null) {
      if (newOperations.isEmpty) {
        emit(CartLoaded(state.cart!));
      } else {
        emit(CartOperationInProgress(
          cart: state.cart!,
          loadingOperations: newOperations,
          operationTypes: newOperationTypes,
        ));
      }
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}