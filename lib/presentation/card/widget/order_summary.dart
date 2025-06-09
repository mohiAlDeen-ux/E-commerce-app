import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/cart/entity/pricing_entity.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_application_1/presentation/card/widget/summary_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.cart != null) {
          PricingEntity pricingEntity = state.cart!.pricing;
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SummaryRow('Subtotal', pricingEntity.subtotal),
                SummaryRow('Shipping', pricingEntity.shippingCost.cost),
                SummaryRow('Tax', pricingEntity.tax.amount),
                const Divider(height: 30, thickness: 1.5),
                SummaryRow('TOTAL', pricingEntity.total, isTotal: true),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}