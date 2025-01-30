import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../bookmark/pages/bookmark.dart';
import '../../card/pages/card.dart';
import '../../discover/pages/discover.dart';
import '../../home/page/home.dart';
import '../../profile/pages/profile.dart';
import '../bloc/nav_cubit.dart';
import '../bloc/nav_state.dart';

class BottomNavBarPage extends StatelessWidget {
  BottomNavBarPage({super.key});

  late Widget curentPage;

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark
                        ? 0.3
                        : 1), // on copilet
            BlendMode.srcIn),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavCubit(),
        ),
      ],
      child: BlocBuilder<NavCubit, NavState>(
        builder: (context, navState) {
          switch (navState) {
            case NavState.HomeScreen:
              curentPage = HomePage();
              break;

            case NavState.DiscoverScreen:
              curentPage = DiscoverPage();
              break;

            case NavState.BookmarkScreen:
              curentPage = BookmarkPage();
              break;

            case NavState.CardScreen:
              curentPage = CardPage();
              break;

            case NavState.ProfileScreen:
              curentPage = ProfilePage();
              break;

            default:
              curentPage = Container(
                child: Text("default"),
              );
              break;
          }
          ;

          return Scaffold(
            appBar: AppBar(
              // pinned: true,
              // floating: true,
              // snap: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const SizedBox(),
              leadingWidth: 0,
              centerTitle: false,
              title: SvgPicture.asset(
                "assets/logo/Shoplon.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                height: 20,
                width: 100,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, searchScreenRoute);
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/Search.svg",
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).textTheme.bodyLarge!.color!,
                        BlendMode.srcIn),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, notificationsScreenRoute);
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/Notification.svg",
                    height: 24,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).textTheme.bodyLarge!.color!,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            body: PageTransitionSwitcher(
              duration: defaultDuration,
              transitionBuilder: (child, animation, secondAnimation) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondAnimation,
                  child: child,
                );
              },
              child: curentPage,
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(top: defaultPadding / 2),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : const Color(0xFF101015),
              child: BottomNavigationBar(
                currentIndex: getNavIndex(navState),
                onTap: (index) {
                  if (index != getNavIndex(navState)) {
                    context.read<NavCubit>().setScreen(getNavPyIndex(index));
                  }
                },
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : const Color(0xFF101015),
                type: BottomNavigationBarType.fixed,
                // selectedLabelStyle: TextStyle(color: primaryColor),
                selectedFontSize: 12,
                selectedItemColor: primaryColor,
                unselectedItemColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                    icon: svgIcon("assets/icons/Shop.svg"),
                    activeIcon:
                        svgIcon("assets/icons/Shop.svg", color: primaryColor),
                    label: S.of(context).home_page_label,
                  ),
                  BottomNavigationBarItem(
                    icon: svgIcon("assets/icons/Category.svg"),
                    activeIcon: svgIcon("assets/icons/Category.svg",
                        color: primaryColor),
                    label: S.of(context).discover_page_label,
                  ),
                  BottomNavigationBarItem(
                    icon: svgIcon("assets/icons/Bookmark.svg"),
                    activeIcon: svgIcon("assets/icons/Bookmark.svg",
                        color: primaryColor),
                    label: S.of(context).bookmark_page_label,
                  ),
                  BottomNavigationBarItem(
                    icon: svgIcon("assets/icons/Bag.svg"),
                    activeIcon:
                        svgIcon("assets/icons/Bag.svg", color: primaryColor),
                    label: S.of(context).cart_page_label,
                  ),
                  BottomNavigationBarItem(
                    icon: svgIcon("assets/icons/Profile.svg"),
                    activeIcon: svgIcon("assets/icons/Profile.svg",
                        color: primaryColor),
                    label: S.of(context).profile_page_label,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
