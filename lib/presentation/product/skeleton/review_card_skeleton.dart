import 'package:flutter/material.dart';
import '../../../common/widget/skeleton.dart';
import '../../../core/constant/constant.dart';
import '../widget/review_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCardSkeleton extends StatelessWidget {
  const ReviewCardSkeleton({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.035),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadious)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Skeleton(
                  height: 30,
                  width: 65,
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                const Skeleton(),
                const SizedBox(height: defaultPadding),
                RatingBar.builder(
                  initialRating: 0,
                  itemSize: 20,
                  itemPadding: const EdgeInsets.only(right: defaultPadding / 4),
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
          const Expanded(
            child: Column(
              children: [
                RateBar(star: 5, value: 0),
                RateBar(star: 4, value: 0),
                RateBar(star: 3, value: 0),
                RateBar(star: 2, value: 0),
                RateBar(star: 1, value: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}