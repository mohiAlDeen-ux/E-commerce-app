import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_application_1/presentation/card/widget/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8, bottom: 12),
              child: Text('Your Items',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            state.cart == null
                ? const CircularProgressIndicator() // here i must add the skeleton(list of container)
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.cart!.items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return ProductItem(
                        cartItem: state.cart!.items[index],
                        onRemove: () {
                          context.read<CartBloc>().add(
                              RemoveItemFromCart(state.cart!.items[index].id));
                        },
                        onEdit: () {},
                      );
                    },
                  ),
          ],
        );
      },
    );
  }
}
