import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/widget/skeleton.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/constant/constant.dart';

import '../bloc/product_avaliable_cubit.dart';
import '../bloc/product_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class ProductInfo extends StatelessWidget {
  final String brand;
  final String title;

  const ProductInfo({
    super.key,
    required this.brand,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductAvaliableCubit, TaskState>(
      builder: (context, isAvaliableState) {
        return BlocBuilder<ProductCubit, TaskState>(
          builder: (context, productState) {
            if(productState is FailureState || isAvaliableState is FailureState){
              return const SliverToBoxAdapter(child: Text("errorrr r r r r r r r "));
            }else{
              return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(
                      title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: defaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(isAvaliableState is LoadingState)
                        const Skeleton(width: 120,height: 33,layer: 2,radious: defaultPadding/2,)
                        else if(isAvaliableState is SuccessState)
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          decoration: BoxDecoration(
                            color: isAvaliableState.data ? successColor : errorColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(defaultBorderRadious / 2),
                            ),
                          ),
                          child: Text(
                            isAvaliableState.data
                                ? "Available in stock"
                                : "Currently unavailable",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Spacer(),
                        if(productState is SuccessState)
                        Container(
                          child: Row(children: [
                            SvgPicture.asset("assets/icons/Star_filled.svg"),
                            const SizedBox(width: defaultPadding / 4),
                            Text(
                              "${productState.data.rating} ",
                               style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            Text("(${productState.data.numOfReviews} Reviews)")
                          ],),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Text(
                      "Product Info",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    if(productState is SuccessState)
                    Text(productState.data.description, style: const TextStyle(height: 1.4))
                    else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Skeleton(),
                      const SizedBox(height: defaultPadding /2,),
                      const Skeleton(),
                      const SizedBox(height: defaultPadding /2,),
                      Skeleton(width: MediaQuery.of(context).size.width * 8/10)
                    ],)
                  ],
                ),
              ),
            );
            }
          },
        );
      },
    );
  }
}
