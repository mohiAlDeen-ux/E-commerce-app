import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/common/widget/skeleton.dart';
import 'package:flutter_application_1/core/config/theme/app_colors.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/domain/product/entity/full_product_entity.dart';
import 'package:flutter_application_1/presentation/product/bloc/product_cubit.dart';
import 'package:flutter_application_1/presentation/product/skeleton/review_card_skeleton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, TaskState>(
      builder: (context, state) {
        if (state is SuccessState) {
          FullProductEntity product = state.data as FullProductEntity;
          return Container(
            padding: const EdgeInsets.all(defaultPadding),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.035),
              borderRadius:
                  const BorderRadius.all(Radius.circular(defaultBorderRadious)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "${product.rating} ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: "/5",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Text("Based on ${product.numOfReviews} Reviews"),
                      const SizedBox(height: defaultPadding),
                      RatingBar.builder(
                        initialRating: product.rating,
                        itemSize: 20,
                        itemPadding:
                            const EdgeInsets.only(right: defaultPadding / 4),
                        unratedColor: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.08),
                        glow: false,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        onRatingUpdate: (value) {},
                        itemBuilder: (context, index) =>
                            SvgPicture.asset("assets/icons/Star_filled.svg"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: Column(
                    children: [
                      RateBar(
                          star: 5,
                          value: product.numOfFiveStar / product.numOfReviews),
                      RateBar(
                          star: 4,
                          value: product.numOfFourStar / product.numOfReviews),
                      RateBar(
                          star: 3,
                          value: product.numOfThreeStar / product.numOfReviews),
                      RateBar(
                          star: 2,
                          value: product.numOfTwoStar / product.numOfReviews),
                      RateBar(
                          star: 1,
                          value: product.numOfOneStar / product.numOfReviews),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return ReviewCardSkeleton();
        }
      },
    );
  }
}

class RateBar extends StatelessWidget {
  const RateBar({
    super.key,
    required this.star,
    required this.value,
  });

  final int star;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: star == 1 ? 0 : defaultPadding / 2),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text(
              "$star Star",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Theme.of(context).textTheme.bodyMedium!.color),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(defaultBorderRadious),
              ),
              child: LinearProgressIndicator(
                minHeight: 6,
                color: warningColor,
                backgroundColor: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.05),
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
