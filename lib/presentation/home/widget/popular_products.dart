import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/product/entity/product_entity.dart';
import 'package:flutter_application_1/domain/product/usecase/get_popular_products_usecase.dart';
import 'package:flutter_application_1/presentation/home/skeleton/products_skelton.dart';
import 'package:flutter_application_1/presentation/home/widget/product_card.dart';
import 'package:flutter_application_1/presentation/product/pages/product_detail_screen.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import '../bloc/products/popular_product_cubit.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(   
      create: (context) => PopularProductCubit()..getPopularProducts(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
              "Popular Products",
              style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            BlocBuilder<PopularProductCubit, TaskState>(
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