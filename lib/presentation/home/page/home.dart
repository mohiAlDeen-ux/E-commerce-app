import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/presentation/home/widget/categories.dart';
import 'package:flutter_application_1/presentation/home/widget/offers_carousel.dart';
import 'package:flutter_application_1/presentation/home/widget/popular_products.dart';


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
        )
      ],),
    );
  }
}