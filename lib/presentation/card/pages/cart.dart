import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/button/button_cubit.dart';
import 'package:flutter_application_1/common/bloc/error_masage/erorr_masage_cubit.dart';
import 'package:flutter_application_1/common/widget/error_masage.dart';
import 'package:flutter_application_1/domain/cart/entity/cart_entity.dart';
import 'package:flutter_application_1/presentation/card/bloc/cart_bloc.dart';
import 'package:flutter_application_1/presentation/card/widget/buttom_section.dart';
import 'package:flutter_application_1/presentation/card/widget/delivery_card.dart';
import 'package:flutter_application_1/presentation/card/widget/fixed_header.dart';
import 'package:flutter_application_1/presentation/card/widget/payment_card.dart';
import 'package:flutter_application_1/presentation/card/widget/product_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  double get headerHeight => 60.0;
  double get buttonHeight => 60.0;
  double get sectionPadding => 16.0;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc()..add(LoadCart()),
        ),
        BlocProvider(
          create: (context) => ButtonCubit(),
        ),
        BlocProvider(create: (context) => ErrorMasageCubit()),
      ],
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          //if (state.cart != null) {
            //CartEntity cartEntity = state.cart!;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    const FixedHeader(),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: buttonHeight,
                          left: sectionPadding,
                          right: sectionPadding,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height -
                                  headerHeight -
                                  buttonHeight -
                                  (isLandscape ? 0 : 100)),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 16),
                              DeliveryCard(),
                              SizedBox(height: 16),
                              PaymentCard(),
                              SizedBox(height: 16),
                              ProductList(),
                              SizedBox(height: 40),
                              ErrorMasage(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: const BottomSection(),
            );
          //} else {
          //  return const Center(child: CircularProgressIndicator());
          //}
        },
      ),
    );
  }
}
