import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/flash_sell_product_cubit.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/popular_product_cubit.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/top_selling_product_cubit.dart';
import 'package:flutter_application_1/presentation/home/widget/flash_sell_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/constant.dart';
import '../widget/categories.dart';
import '../widget/offers_carousel.dart';
import '../widget/popular_products.dart';
import '../widget/top_selling_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TopSellingProductCubit()..loadProducts(),
        ),
        BlocProvider(
          create: (context) => PopularProductCubit()..loadProducts(),
        ),
        BlocProvider(
          create: (context) => FlashSellProductCubit()..loadProducts(),
        ),
      ],
      child: Scaffold(
        body: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.wait([
                context.read<PopularProductCubit>().refresh(),
                context.read<TopSellingProductCubit>().refresh(),
                context.read<FlashSellProductCubit>().refresh(),
              ]);
            },
            child: const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: OffersCarousel(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: defaultPadding / 2),
                ),
                SliverToBoxAdapter(
                  child: Categories(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: defaultPadding,
                  ),
                ),
                SliverToBoxAdapter(
                  child: PopularProducts(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: defaultPadding,
                  ),
                ),
                SliverToBoxAdapter(
                  child: TopSellingProduct(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: defaultPadding,
                  ),
                ),
                SliverToBoxAdapter(
                  child: FlashSellProducts(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
