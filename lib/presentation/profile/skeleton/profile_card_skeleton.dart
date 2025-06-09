import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

import '../../../common/widget/skeleton.dart';

class ProfileCardSkeleton extends StatelessWidget {
  final isShowArrow;


  const ProfileCardSkeleton({super.key, this.isShowArrow});

  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: const CircleAvatar(
            radius: 28,
            child: Skeleton(radious: 28,)
          ),
          title: const Row(
            children: [
              Skeleton(width: 100,),
            ],
          ),
          subtitle: const Skeleton(),
          trailing: isShowArrow
              ? SvgPicture.asset(
                  "assets/icons/miniRight.svg",
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.4),
                )
              : null,
        );
  }
}