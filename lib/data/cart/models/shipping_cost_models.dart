import 'package:flutter_application_1/domain/cart/entity/shipping_cost_entity.dart';

class ShippingCostModels {
  final String method;
  final double cost;
  final String description;

  ShippingCostModels({
    required this.method,
    required this.cost,
    required this.description,
  });

  factory ShippingCostModels.fromMap(Map<String, dynamic> map) {
    return ShippingCostModels(
      method: map['method'] as String,
      cost: (map['cost'] as num).toDouble(),
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'cost': cost,
      'description': description,
    };
  }

  ShippingCostEntity toEntity() {
    return ShippingCostEntity(
        method: method, cost: cost, description: description);
  }
}
