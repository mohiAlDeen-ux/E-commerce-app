import 'package:flutter_application_1/domain/cart/entity/cart_item_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/payment_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/pricing_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/shipping_info_entity.dart';

class CartEntity {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String currency;
  final List<CartItemEntity> items;
  final PricingEntity pricing;
  final ShippingInfoEntity shippingInfo; // Root-level shipping
  final PaymentEntity payment;

  CartEntity({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
    required this.items,
    required this.pricing,
    required this.shippingInfo,
    required this.payment,
  });

  factory CartEntity.fromMap(Map<String, dynamic> map) {
    return CartEntity(
      id: map['id'] as String,
      userId: map['userId'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      currency: map['currency'] as String,
      items: (map['items'] as List).map((e) => CartItemEntity.fromMap(e)).toList(),
      pricing: PricingEntity.fromMap(map['pricing'] as Map<String, dynamic>),
      shippingInfo: ShippingInfoEntity.fromMap(map['shipping'] as Map<String, dynamic>),
      payment: PaymentEntity.fromMap(map['payment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'currency': currency,
      'items': items.map((e) => e.toMap()).toList(),
      'pricing': pricing.toMap(),
      'shipping': shippingInfo.toMap(),
      'payment': payment.toMap(),
    };
  }
}