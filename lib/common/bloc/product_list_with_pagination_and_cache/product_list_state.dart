import 'package:flutter_application_1/domain/product/entity/product_entity.dart';

abstract class ProductsListState {
  final List<ProductEntity> products;
  final bool hasReachedMax;

  const ProductsListState({
    required this.products,
    this.hasReachedMax = false,
  });
}

class ProductsInitial extends ProductsListState {
  const ProductsInitial() : super(products: const [],hasReachedMax: false);
}

class ProductsLoading extends ProductsListState {
  const ProductsLoading({
    required super.products,
    super.hasReachedMax,
  });
}


class ProductsLoaded extends ProductsListState {
  const ProductsLoaded({
    required super.products,
    super.hasReachedMax,
  });
}

class ProductsLoadedLocaly extends ProductsListState{
  const ProductsLoadedLocaly({
    required super.products,
    super.hasReachedMax = true,
  });  
}

class ProductsError extends ProductsListState {
  final String message;

  const ProductsError({
    required super.products,
    required this.message,
    super.hasReachedMax,
  });
}