import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/home/bloc/products/top_selling_product_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/product/entity/product_entity.dart';
import '../bloc/products/top_selling_product_cubit.dart';
import '../skeleton/products_skelton.dart';
import 'product_card.dart';
import '../../product/pages/product_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingProduct extends StatefulWidget {
  const TopSellingProduct({super.key});

  @override
  State<TopSellingProduct> createState() => _TopSellingProductState();
}



class _TopSellingProductState extends State<TopSellingProduct> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

    void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<TopSellingProductCubit>().loadTopSellingProduct();
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
              "Top Selling Products",
              style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            BlocBuilder<TopSellingProductCubit, TopSellingState>(
              builder: (context, state) {
                if(state is TopSellingInitial){
                  return const ProductsSkelton();
                }
                else{
                  final List<ProductEntity> _products = state.products;
                  return SizedBox(
                    height: 220,
                    child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: state is TopSellingLoading ? _products.length + 1 : _products.length ,
                      itemBuilder: (BuildContext context, int index) { 
                        if(index < _products.length){
                          return Padding(
                          padding: EdgeInsets.only(left: defaultPadding, right: index == _products.length - 1?defaultPadding:0 ),
                          child: ProductCard(productEntity: _products[index], press: () => AppNavigator.push(context,ProductDetailScreen(productEntity:_products[index]))),
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