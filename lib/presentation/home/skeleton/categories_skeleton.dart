import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widget/skeleton.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'dart:math';

int getRandomNumber(int min, int max){
  return min + Random().nextInt(max - min + 1);
}

class CategoriesSkeleton extends StatelessWidget {
  const CategoriesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context ,index) => Padding(
        padding: EdgeInsets.only(left: index == 0?defaultPadding:defaultPadding/4),
        child: Skeleton(height:double.infinity ,width: getRandomNumber(50,100).toDouble(),),
        ),
      );
  }
}