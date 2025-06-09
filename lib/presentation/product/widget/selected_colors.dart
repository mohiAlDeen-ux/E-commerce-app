import 'package:flutter/material.dart';
import '../../../core/constant/constant.dart';
import '../../../generated/l10n.dart';

import 'color_dot.dart';

class SelectedColors extends StatelessWidget {
  const SelectedColors({
    super.key,
    required this.colors,
    required this.selectedColorIndex,
    required this.press,
  });
  final List<Color> colors;
  final int selectedColorIndex;
  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "${S.of(context).select} ${S.of(context).color}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              colors.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    left: index == 0 && Directionality.of(context) == TextDirection.ltr? defaultPadding : defaultPadding / 2,
                    right: index == 0 && Directionality.of(context) == TextDirection.rtl? defaultPadding : defaultPadding / 2),
                child: ColorDot(
                  color: colors[index],
                  isActive: selectedColorIndex == index,
                  press: () => press(index),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
