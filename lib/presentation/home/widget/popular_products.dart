import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/popular_product_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
import '../skeleton/products_skelton.dart';
import 'product_card.dart';
import '../../product/pages/product_detail_screen.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import '../bloc/products/popular_product_cubit.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<PopularProductCubit>().loadPopularProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            BlocBuilder<PopularProductCubit, PopularState>(
              builder: (context, state) {
                if(state is PopularInitial){
                  return const ProductsSkelton();
                }else{
                  final List<ProductEntity> _products = state.products;
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: state is PopularLoading ? _products.length + 1: _products.length,
                      itemBuilder: (BuildContext context, int index) { 
                        if (index < _products.length){
                          return Padding(
                            padding: EdgeInsets.only(left: defaultPadding, right: index == _products.length - 1?defaultPadding:0 ),
                            child: ProductCard(productEntity: _products[index], press: () => AppNavigator.push(context,ProductDetailScreen(productEntity:_products[index]))),  // here i pass the product as argument put in i need to fixid it by cubit
                            );
                        }else{
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: CircularProgressIndicator()),
                          ); 
                        }

                      },
                    ),
                  );
                }
              },
            )
          ],
        
    );
  }
}