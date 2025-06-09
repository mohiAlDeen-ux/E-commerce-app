import 'package:flutter_application_1/domain/cart/entity/payment_entity.dart';

class PaymentModels {
  final String method;
  final Map<String, dynamic>? details;

  PaymentModels({
    required this.method,
    this.details,
  });

  factory PaymentModels.fromMap(Map<String, dynamic> map) {
    return PaymentModels(
      method: map['method'] as String,
      details: map['details'] != null
          ? Map<String, dynamic>.from(map['details'] as Map)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'details': details,
    };
  }

  PaymentEntity toEntity() {
    return PaymentEntity(
      method: method,
      details: details,
    );
  }
}
