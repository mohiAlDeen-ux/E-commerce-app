import 'package:flutter/material.dart';
import '../../../common/widget/skeleton.dart';
import '../../../core/constant/constant.dart';
import '../../home/skeleton/products_skelton.dart';

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
                    return ProductsSkelton();
                  },
                  childCount: 20,
                ),
              
            
          
        ));
  }
}
