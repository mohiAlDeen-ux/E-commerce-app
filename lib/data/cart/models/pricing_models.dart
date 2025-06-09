import 'package:flutter_application_1/data/cart/models/cart_discount_models.dart';
import 'package:flutter_application_1/data/cart/models/shipping_cost_models.dart';
import 'package:flutter_application_1/data/cart/models/tax_models.dart';
import 'package:flutter_application_1/domain/cart/entity/pricing_entity.dart';

class PricingModels {
  final double subtotal;
  final double itemDiscounts;
  final CartDiscountModels? cartDiscount;
  final ShippingCostModels shippingCost; // pricing.shipping
  final TaxModels tax;
  final double total;
  final String currency;

  PricingModels({
    required this.subtotal,
    required this.itemDiscounts,
    this.cartDiscount,
    required this.shippingCost,
    required this.tax,
    required this.total,
    required this.currency,
  });

  factory PricingModels.fromMap(Map<String, dynamic> map) {
    return PricingModels(
      subtotal: (map['subtotal'] as num).toDouble(),
      itemDiscounts: (map['itemDiscounts'] as num).toDouble(),
      cartDiscount: map['cartDiscount'] != null
          ? CartDiscountModels.fromMap(
              map['cartDiscount'] as Map<String, dynamic>)
          : null,
      shippingCost:
          ShippingCostModels.fromMap(map['shipping'] as Map<String, dynamic>),
      tax: TaxModels.fromMap(map['tax'] as Map<String, dynamic>),
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

  PricingEntity toEntity() {
    return PricingEntity(
      subtotal: subtotal,
      itemDiscounts: itemDiscounts,
      cartDiscount: cartDiscount?.toEntity(),
      shippingCost: shippingCost.toEntity(), // pricing.shipping
      tax: tax.toEntity(),
      total: total,
      currency: currency,
    );
  }
}
