class ShippingCostEntity {
  final String method;
  final double cost;
  final String description;

  ShippingCostEntity({
    required this.method,
    required this.cost,
    required this.description,
  });

  factory ShippingCostEntity.fromMap(Map<String, dynamic> map) {
    return ShippingCostEntity(
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
}