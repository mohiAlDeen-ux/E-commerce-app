import 'package:flutter_application_1/data/cart/models/cart_item_models.dart';
import 'package:flutter_application_1/data/cart/models/payment_models.dart';
import 'package:flutter_application_1/data/cart/models/pricing_models.dart';
import 'package:flutter_application_1/data/cart/models/shipping_info_models.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';

class CartModels {
  final String id;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String currency;
  final List<CartItemModels> items;
  final PricingModels pricing;
  final ShippingInfoModels shippingInfo; // Root-level shipping
  final PaymentModels payment;

  CartModels({
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

  factory CartModels.fromMap(Map<String, dynamic> map) {
    return CartModels(
      id: map['id'] as String,
      userId: map['userId'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      currency: map['currency'] as String,
      items: (map['items'] as List).map((e) => CartItemModels.fromMap(e)).toList(),
      pricing: PricingModels.fromMap(map['pricing'] as Map<String, dynamic>),
      shippingInfo: ShippingInfoModels.fromMap(map['shipping'] as Map<String, dynamic>),
      payment: PaymentModels.fromMap(map['payment'] as Map<String, dynamic>),
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

  CartEntity toEntity(){
    return CartEntity(
    id:id,
    userId:userId,
    createdAt:createdAt,
    updatedAt:updatedAt,
    currency:currency,
    items:items.map((item) => item.toEntity()).toList(),
    pricing:pricing.toEntity(),
    shippingInfo:shippingInfo.toEntity(),
    payment:payment.toEntity(),
      );
  }
}