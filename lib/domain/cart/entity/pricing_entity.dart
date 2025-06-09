import 'package:flutter_application_1/domain/cart/entity/cart_discount_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/shipping_cost_entity.dart';
import 'package:flutter_application_1/domain/cart/entity/tax_entity.dart';

class PricingEntity {
  final double subtotal;
  final double itemDiscounts;
  final CartDiscountEntity? cartDiscount;
  final ShippingCostEntity shippingCost; // pricing.shipping
  final TaxEntity tax;
  final double total;
  final String currency;

  PricingEntity({
    required this.subtotal,
    required this.itemDiscounts,
    this.cartDiscount,
    required this.shippingCost,
    required this.tax,
    required this.total,
    required this.currency,
  });

  factory PricingEntity.fromMap(Map<String, dynamic> map) {
    return PricingEntity(
      subtotal: (map['subtotal'] as num).toDouble(),
      itemDiscounts: (map['itemDiscounts'] as num).toDouble(),
      cartDiscount: map['cartDiscount'] != null
          ? CartDiscountEntity.fromMap(map['cartDiscount'] as Map<String, dynamic>)
          : null,
      shippingCost: ShippingCostEntity.fromMap(map['shipping'] as Map<String, dynamic>),
      tax: TaxEntity.fromMap(map['tax'] as Map<String, dynamic>),
      total: (map['total'] as num).toDouble(),
      currency: map['currency'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subtotal': subtotal,
      'itemDiscounts': itemDiscounts,
      'cartDiscount': cartDiscount?.toMap(),
      'shipping': shippingCost.toMap(),
      'tax': tax.toMap(),
      'total': total,
      'currency': currency,
    };
  }
}