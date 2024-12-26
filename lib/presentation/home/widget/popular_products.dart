import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/constant.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular Products"),
        SizedBox(
          height: defaultPadding,
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) { 
            
           },

        )
      ],
    );
  }
}