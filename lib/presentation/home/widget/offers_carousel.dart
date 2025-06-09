import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/widget/M/banner_m_style_1.dart';
import '../../../common/widget/M/banner_m_style_2.dart';
import '../../../common/widget/M/banner_m_style_3.dart';
import '../../../common/widget/M/banner_m_style_4.dart';
import '../../../common/widget/dot_indicators.dart';
import '../../../core/constant/constant.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({super.key});

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  late PageController _pageController;
  late Timer _timer;

  int pageIndex = 0;

  List offers = [
    BannerMStyle1(
      text: "New items with \nFree shipping",
      press: () {},
    ),
    BannerMStyle2(
      title: "Black \nfriday",
      subtitle: "Collection",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle3(
      title: "Grab \nyours now",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle4(
      // image: , user your image
      title: "SUMMER \nSALE",
      subtitle: "SPECIAL OFFER",
      discountParcent: 80,
      press: () {},
    ),];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _startAutoFlipTimer();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoFlipTimer() {
      try{
        _timer.cancel();
      }catch(error){

      }
         _timer = Timer.periodic(const Duration(seconds: 5), (_){
      if (pageIndex < offers.length - 1){
        pageIndex += 1;
      }else{
        pageIndex = 0;
      }

    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 350),
      curve: Curves.bounceInOut);
    });
   }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
          controller: _pageController,
          itemCount: offers.length,
          itemBuilder: (BuildContext context, int index) { 
            return offers[index];
          },
          onPageChanged: (index){
            setState(() {
              _startAutoFlipTimer();
              pageIndex = index;
            });
          },
        ),
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: SizedBox(
              height: 16,
              child: Row(children: [
                ...List.generate(offers.length, (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding / 4),
                  child: DotIndicator(
                    isActive: index == pageIndex,
                    activeColor: Colors.white70,
                    inActiveColor: Colors.white54,
                  ),
                  ))
              ],),
              ),
          ),
        )
        ]
      ),
    );
  }
}