import 'package:flutter/material.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
import '../bloc/products/top_selling_product_cubit.dart';
import '../skeleton/products_skelton.dart';
import 'product_card.dart';
import '../../product/pages/product_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingProduct extends StatelessWidget {
  const TopSellingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(   
      create: (context) => TopSellingProductCubit()..getTopSellingProducts(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
              "Top Selling Products",
              style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            BlocBuilder<TopSellingProductCubit, TaskState>(
              builder: (context, state) {
                if(state is SuccessState){
                  final List<ProductEntity> _products = state.data as List<ProductEntity>;
                  return Container(
                    height: 220,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _products.length,
                      itemBuilder: (BuildContext context, int index) { 
                        return Padding(
                          padding: EdgeInsets.only(left: defaultPadding, right: index == _products.length - 1?defaultPadding:0 ),
                          child: ProductCard(productEntity: _products[index], press: () => AppNavigator.push(context,ProductDetailScreen(productEntity:_products[index]))),
                          );
                      },
                    ),
                  );
                }else{
                  return const ProductsSkelton();
              }
              },
            )
          ],
        ),
    );
  }
}