import 'package:flutter/material.dart';
import '../../home/skeleton/product_card_skelton.dart';
import '../../../core/constant/constant.dart';

class BookmarksSkeleton extends StatelessWidget {
  const BookmarksSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              sliver: SliverGrid(
                
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.66,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const ProductCardSkelton();
                  },
                  childCount: 20,
                ),
              
            
          
        ));
  }
}
