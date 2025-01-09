import 'package:flutter/material.dart';
import '../../../core/constant/constant.dart';
import '../widget/categories.dart';
import '../widget/offers_carousel.dart';
import '../widget/popular_products.dart';
import '../widget/top_selling_product.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: OffersCarousel(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: defaultPadding/2 ),
        ),
        SliverToBoxAdapter(
          child: Categories(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: defaultPadding,),
        ),
        SliverToBoxAdapter(
          child: PopularProducts(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: defaultPadding,),
        ),
        SliverToBoxAdapter(
          child: TopSellingProduct(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: defaultPadding,),
        ),
        SliverToBoxAdapter(
          child: TopSellingProduct(),
        ),
      ],),
    );
  }
}