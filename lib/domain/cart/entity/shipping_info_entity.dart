import 'package:flutter_application_1/domain/cart/entity/address_entity.dart';

class ShippingInfoEntity {
  final String method;
  final AddressEntity address;
  final DateTime estimatedDelivery;

  ShippingInfoEntity({
    required this.method,
    required this.address,
    required this.estimatedDelivery,
  });

  factory ShippingInfoEntity.fromMap(Map<String, dynamic> map) {
    return ShippingInfoEntity(
      method: map['method'] as String,
      address: AddressEntity.fromMap(map['address'] as Map<String, dynamic>),
      estimatedDelivery: DateTime.parse(map['estimatedDelivery'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'address': address.toMap(),
      'estimatedDelivery': estimatedDelivery.toIso8601String(),
    };
  }
}