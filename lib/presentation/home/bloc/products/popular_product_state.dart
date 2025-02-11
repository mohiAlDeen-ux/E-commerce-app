import 'package:flutter_application_1/domain/product/entity/product_entity.dart';

abstract class PopularState {
  final List<ProductEntity> products;
  final bool hasReachedMax;

  const PopularState({
    required this.products,
    this.hasReachedMax = false,
  });
}

class PopularInitial extends PopularState {
  const PopularInitial() : super(products: const []);
}

class PopularLoading extends PopularState {
  const PopularLoading({
    required super.products,
    super.hasReachedMax,
  });
}


class PopularLoaded extends PopularState {
  const PopularLoaded({
    required super.products,
    super.hasReachedMax,
  });
}

class PopularError extends PopularState {
  final String message;

  const PopularError({
    required super.products,
    required this.message,
    super.hasReachedMax,
  });
}