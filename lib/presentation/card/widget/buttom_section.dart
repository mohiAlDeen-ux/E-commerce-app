import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/button/button_cubit.dart';
import 'package:flutter_application_1/common/bloc/error_masage/erorr_masage_cubit.dart';
import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/common/widget/basic_reactive_button.dart';
import 'package:flutter_application_1/domain/cart/usecase/place_order_usecase.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_application_1/presentation/card/widget/order_summary.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  bool _summaryVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => setState(() => _summaryVisible = !_summaryVisible),
            child: Container(
              height: 40,
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _summaryVisible
                        ? "HIDE ORDER SUMMARY"
                        : "SHOW ORDER SUMMARY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                      letterSpacing: -0.2,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _summaryVisible
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.blue.shade800,
                  ),
                ],
              ),
            ),
          ),

          // Collapsible summary
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SizedBox(
              height: _summaryVisible ? null : 0,
              child: const OrderSummary(),
            ),
          ),

          // Fixed Place Order button
          BlocBuilder<CartBloc, CartState>(
            builder: (context, cartState) {
              //if (state.cart != null) {
              return Container(
                height: 60.0, // button hight
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 6), //section padding
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TOTAL',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12)),
                        Text(cartState.cart == null ?"\$" :'\$${cartState.cart!.pricing.total}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      child: BlocListener<ButtonCubit, TaskState>(
                        listener: (context, state) {
                          if (state is FailureState) {
                            context.read<ErrorMasageCubit>().showError("test");
                          }
                        },
                        child: cartState.cart == null
                            ? BasicReactiveButton(
                              content: const Text("PLACE ORDER"),
                                height: 18,
                                onPressed: () {},
                              )
                            : BasicReactiveButton(
                                content: const Text("PLACE ORDER"),
                                height: 18,
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context2) {
                                      return AlertDialog(
                                        title: const Text("Order Confirmation"),
                                        content: const Text(
                                            "Do you want to place order?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              context
                                                  .read<ButtonCubit>()
                                                  .execute(getIt.call<
                                                      PlaceOrderUsecase>());
                                            },
                                            child: const Text("Yes"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("No"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
