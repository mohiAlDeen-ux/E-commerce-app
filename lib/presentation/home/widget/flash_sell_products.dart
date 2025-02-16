import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/product_list_with_pagination_and_cache/product_list_state.dart';
import 'package:flutter_application_1/common/widget/product_list_skeleton.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/flash_sell_product_cubit.dart';
import 'package:flutter_application_1/presentation/product/bloc/familiar_product_cubit.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
import 'product_card.dart';
import '../../product/pages/product_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashSellProducts extends StatefulWidget {
  const FlashSellProducts({super.key});

  @override
  State<FlashSellProducts> createState() => _FlashSellProductsState();
}



class _FlashSellProductsState extends State<FlashSellProducts> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

    void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 50) {
      context.read<FlashSellProductCubit>().loadProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
              "Flash Sell Products",
              style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            BlocBuilder<FlashSellProductCubit, ProductsListState>(
              builder: (context, state) {
                if(state is ProductsInitial  || (state is ProductsLoading && state.products.isEmpty)){
                  return const ProductListSkeleton();
                }
                else{
                  final List<ProductEntity> _products = state.products;
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: state is ProductsLoading ? _products.length + 1 : _products.length ,
                      itemBuilder: (BuildContext context, int index) { 
                        if(index < _products.length){
                          return Padding(
                          padding: EdgeInsets.only(
                              left: Directionality.of(context) == TextDirection.ltr? defaultPadding:0,
                              right: Directionality.of(context) == TextDirection.rtl? defaultPadding:0, 
                            ),
                          child: ProductCard(productEntity: _products[index], press: () =>  AppNavigator.push(
                            context,  BlocProvider(
                               create: (context) => FamiliarProductCubit(productId: _products[index].id),
                                child: ProductDetailScreen(productEntity: _products[index]),
                              ))),
                          );
                        } else{
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