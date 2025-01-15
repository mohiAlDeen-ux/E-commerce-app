import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/domain/categories/entity/categories_entity.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ExpansionCategory extends StatelessWidget {
  const ExpansionCategory({
    super.key,
    required this.title,
    required this.subCategory,
    required this.svgSrc,
  });

  final String title, svgSrc;
  final List<CategoryEntity> subCategory;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      collapsedIconColor: Theme.of(context).textTheme.bodyMedium!.color,
      leading: SvgPicture.asset(
        svgSrc,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
      textColor: Theme.of(context).textTheme.bodyLarge!.color,
      childrenPadding: const EdgeInsets.only(left: defaultPadding * 3.5),
      children: List.generate(
        subCategory.length,
        (index) => Column(
          children: [
            ListTile(
              onTap: () {
              },
              title: Text(
                subCategory[index].categoryName,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            if (index < subCategory.length - 1) const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
