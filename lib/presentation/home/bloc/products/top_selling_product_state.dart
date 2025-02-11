import 'package:flutter_application_1/domain/product/entity/product_entity.dart';

abstract class TopSellingState {
  final List<ProductEntity> products;
  final bool hasReachedMax;

  const TopSellingState({
    required this.products,
    this.hasReachedMax = false,
  });
}

class TopSellingInitial extends TopSellingState {
  const TopSellingInitial() : super(products: const []);
}

class TopSellingLoading extends TopSellingState {
  const TopSellingLoading({
    required super.products,
    super.hasReachedMax,
  });
}

class TopSellingLoaded extends TopSellingState {
  const TopSellingLoaded({
    required super.products,
    super.hasReachedMax,
  });
}

class TopSellingError extends TopSellingState {
  final String message;

  const TopSellingError({
    required super.products,
    required this.message,
    super.hasReachedMax,
  });
}