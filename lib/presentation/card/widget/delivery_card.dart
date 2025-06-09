import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            
              //AddressEntity addressEntity = state.cart!.shippingInfo.address;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.green),
                      SizedBox(width: 10),
                      Text('Delivery Address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  state.cart == null
                      ? Container( height: 60,)
                      : Text(
                          '${state.cart!.shippingInfo.address.fullName}\n'
                          '${state.cart!.shippingInfo.address.street}\n'
                          '${state.cart!.shippingInfo.address.city}, ${state.cart!.shippingInfo.address.zipCode}\n'
                          '${state.cart!.shippingInfo.address.country}',
                          style: const TextStyle(height: 1.5)),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('CHANGE'),
                    ),
                  ),
                ],
              );
            
          },
        ),
      ),
    );
  }
}