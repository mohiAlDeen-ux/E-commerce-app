
import 'package:flutter/material.dart';
import '../../core/constant/constant.dart';
import '../../presentation/home/skeleton/product_card_skelton.dart';

class ProductListSkeleton extends StatelessWidget{
  const ProductListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
                left: Directionality.of(context) == TextDirection.ltr? defaultPadding:0,
                right: Directionality.of(context) == TextDirection.rtl? defaultPadding:0,
              ),
          child: const ProductCardSkelton(),
        ),
      )
    );
  }
  
}