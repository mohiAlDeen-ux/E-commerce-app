// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/common/widget/skeleton.dart';

class NetworkImageWithLoader extends StatelessWidget {
  
  final String src;
  final BoxFit fit;
  final double radius;

  const NetworkImageWithLoader({
    super.key,
    required this.src,
    this.fit = BoxFit.cover,
    required this.radius,
  });


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        imageUrl: src,
        fit: fit,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        placeholder: (context,url) => const Skeleton(),
        errorWidget: (context,url,error) => const Icon(Icons.error),
        ),
    );
  }
}
