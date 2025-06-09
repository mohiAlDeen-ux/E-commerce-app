import 'package:flutter_application_1/domain/cart/entity/discount_entity.dart';

class DiscountModels {
  final String type;
  final double value;
  final String description;

  DiscountModels({
    required this.type,
    required this.value,
    required this.description,
  });

  factory DiscountModels.fromMap(Map<String, dynamic> map) {
    return DiscountModels(
      type: map['type'] as String,
      value: (map['value'] as num).toDouble(),
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'value': value,
      'description': description,
    };
  }

  DiscountEntity toEntity() {
    return DiscountEntity(type: type, value: value, description: description);
  }
}
