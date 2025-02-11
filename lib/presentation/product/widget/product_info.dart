import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/presentation/product/bloc/rating_information_state.dart';
import '../../../common/widget/skeleton.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/constant/constant.dart';

import '../bloc/product_rating_information_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class ProductInfo extends StatelessWidget {
  final String brand;
  final String title;
  final bool isAvaliable;

  const ProductInfo({
    super.key,
    required this.brand,
    required this.title,
    required this.isAvaliable,
  });

  @override
  Widget build(BuildContext context) {
        return BlocBuilder<ProductRatingInformationsCubit, RatingInformationState>(
          builder: (context, ratingInformationState) {
            if(ratingInformationState is FailureRatingInformationsStateWithoutData){  // this state not happen
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
                      textDirection: TextDirection.ltr,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          decoration: BoxDecoration(
                            color: isAvaliable ? successColor : errorColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(defaultBorderRadious / 2),
                            ),
                          ),
                          child: Text(
                            isAvaliable
                                ? S.of(context).available_in_stock
                                : S.of(context).currently_unavailable,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Spacer(),
                        if(ratingInformationState is! LoadingRatingInformationsState) //
                        Container(
                          child: Row(children: [
                            SvgPicture.asset("assets/icons/Star_filled.svg"),
                            const SizedBox(width: defaultPadding / 4),
                            Text(
                              "${ratingInformationState.ratingInformatioinEntity!.rating} ",
                               style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            Text("(${ratingInformationState.ratingInformatioinEntity!.numOfReviews} ${S.of(context).reviews})")
                          ],),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Text(
                      S.of(context).product_info,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    if(ratingInformationState is! LoadingRatingInformationsState)
                    Text(ratingInformationState.ratingInformatioinEntity!.description, style: const TextStyle(height: 1.4))
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

  }
}
