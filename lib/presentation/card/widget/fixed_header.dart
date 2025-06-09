import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixedHeader extends StatelessWidget {
  const FixedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.shopping_bag_outlined,
              color: Theme.of(context).primaryColor, size: 24),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Review Your Order',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.3,
              ),
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cart == null) {
                return const Text("Loading...");
              } else {
                return Text(
                    state.cart!.items.isNotEmpty
                        ? '${state.cart!.items.length} Items'
                        : "don't have any Item",
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 14));
              }
            },
          ),
        ],
      ),
    );
  }
}
