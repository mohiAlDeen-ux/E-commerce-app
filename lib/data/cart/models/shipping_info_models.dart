import 'package:flutter_application_1/data/cart/models/address_models.dart';
import 'package:flutter_application_1/domain/cart/entity/shipping_info_entity.dart';

class ShippingInfoModels {
  final String method;
  final AddressModels address;
  final DateTime estimatedDelivery;

  ShippingInfoModels({
    required this.method,
    required this.address,
    required this.estimatedDelivery,
  });

  factory ShippingInfoModels.fromMap(Map<String, dynamic> map) {
    return ShippingInfoModels(
      method: map['method'] as String,
      address: AddressModels.fromMap(map['address'] as Map<String, dynamic>),
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


  ShippingInfoEntity toEntity(){
    return ShippingInfoEntity(
        method: method,
        address:address.toEntity(),
        estimatedDelivery:estimatedDelivery
      );  
  }
}