import 'package:flutter/material.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../common/widget/dot_indicators.dart';
import '../../../core/constant/constant.dart';
import '../../auth/pages/signin.dart';
import '../../bottomNavBar/pages/buttomNavBar.dart';
import '../bloc/on_board_cubit.dart';
import '../bloc/on_board_state.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/onbording_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnBoardPage> {
  late PageController _pageController;

  int _pageIndex = 0;

  final List<Onbord> _onbordData = [
    Onbord(
      image: "assets/Illustration/Illustration-0.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "Find the item you’ve \nbeen looking for",
      description:
          "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "Get those ecomace_with_omarping \nbags filled",
      description:
          "Add any item you want to your cart, or save it on your wishlist, so you don’t miss it in your future purchases.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-2.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "Fast & secure \npayment",
      description: "There are many payment options available for your ease.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "Package tracking",
      description:
          "In particular, ecomace_with_omarlon can pack your orders, and help you seamlessly manage your shipments.",
    ),
    Onbord(
      image: "assets/Illustration/Illustration-4.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "Nearby stores",
      description:
          "Easily track nearby ecomace_with_omars, browse through their items and get information about their prodcuts.",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardCubit(),
      child: BlocListener<OnBoardCubit, OnBoardState>(
        listener: (context, state) {
          if(state is UnAuthState){
            AppNavigator.pushAndRemove(context, Signin());
          }else if(state is AuthState){
            AppNavigator.pushAndRemove(context, BottomNavBarPage());
          }
          
        },
        child: Scaffold(
            body: Builder(
              builder: (context) {
                return SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                            
                            context.read<OnBoardCubit>().endOnBoard();
                            //AppNavigator.pushReplacement(context, const MainPage());
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _onbordData.length,
                        onPageChanged: (value) {
                          setState(() {
                            _pageIndex = value;
                          });
                        },
                        itemBuilder: (context, index) => OnbordingContent(
                          isTextOnTop: index.isEven,
                          title: _onbordData[index].title,
                          description: _onbordData[index].description,
                          image: (Theme.of(context).brightness == Brightness.dark &&
                                  _onbordData[index].imageDarkTheme != null)
                              ? _onbordData[index].imageDarkTheme!
                              : _onbordData[index].image,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                            _onbordData.length,
                            (index) => Padding(
                                padding: const EdgeInsets.only(
                                    right: defaultPadding / 4),
                                child: DotIndicator(
                                  isActive: index == _pageIndex,
                                ))),
                        const Spacer(),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_pageIndex < _onbordData.length - 1) {
                                _pageController.nextPage(
                                    duration: defaultDuration, curve: Curves.ease);
                              } else {
                                context.read<OnBoardCubit>().endOnBoard();
                                //AppNavigator.pushAndRemove(context, MainPage());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Arrow - Right.svg",
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
                          ),
                        );
              }
            )),
      ),
    );
  }
}

class Onbord {
  String image;
  String title;
  String description;
  String? imageDarkTheme;

  Onbord({
    required this.image,
    required this.title,
    required this.description,
    this.imageDarkTheme,
  });
}
