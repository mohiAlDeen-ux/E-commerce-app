import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/cart/entity/payment_entity.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.credit_card, color: Colors.blue.shade700),
                const SizedBox(width: 10),
                const Text('Payment Method',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state.cart != null) {
                  PaymentEntity paymentEntity = state.cart!.payment;
                  if (paymentEntity.method == "cash") {
                    return Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text("CASH",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  } else {
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(paymentEntity.details!["brand"],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 12),
                        Text('•••• ${paymentEntity.details!["lastFour"]}',
                            style: const TextStyle(letterSpacing: 1.5)),
                      ],
                    );
                  }
                } else {
                  return const Center(
                    child: SizedBox(height: 20,),
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('CHANGE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}