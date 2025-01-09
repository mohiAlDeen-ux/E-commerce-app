import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../common/widget/divider_list_tile.dart';
import '../../../common/widget/netword_image_with_loader.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/auth/entity/user_entity.dart';
import '../bloc/user_cubit.dart';
import '../widget/profile_card.dart';
import '../widget/profile_menu_item_list_tile.dart';
import 'user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit()..getUser(),
        ),

      ],
      child: Scaffold(
        body: ListView(
          children: [
            Builder(
              builder: (context) {
                return ProfileCard(
                  //proLableText: "Sliver",
                  press: () {
                    AppNavigator.push(
                      context,
                        BlocProvider.value(
                          value: BlocProvider.of<UserCubit>(context),
                          child: const UserInfo(),
                        ),
                      
                    );
                  },
                );
              }
            ),

            BlocBuilder<UserCubit, TaskState>(
              builder: (context, state) {
                if (state is SuccessState) {
                  UserEntity userEntity = state.data;
                  if (userEntity.isPro == false) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding * 1.5),
                      child: GestureDetector(
                        onTap: () {},
                        child:  const AspectRatio(
                          aspectRatio: 1.8,
                          child: NetworkImageWithLoader(
                            src: "https://i.imgur.com/dz0BBom.png",
                            radius: 10,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "Account",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            ProfileMenuListTile(
              text: "Orders",
              svgSrc: "assets/icons/Order.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Returns",
              svgSrc: "assets/icons/Return.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Wishlist",
              svgSrc: "assets/icons/Wishlist.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Addresses",
              svgSrc: "assets/icons/Address.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Payment",
              svgSrc: "assets/icons/card.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Wallet",
              svgSrc: "assets/icons/Wallet.svg",
              press: () {},
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Personalization",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            DividerListTileWithTrilingText(
              svgSrc: "assets/icons/Notification.svg",
              title: "Notification",
              trilingText: "Off",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Preferences",
              svgSrc: "assets/icons/Preferences.svg",
              press: () {},
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: "Language",
              svgSrc: "assets/icons/Language.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Location",
              svgSrc: "assets/icons/Location.svg",
              press: () {},
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Help & Support",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: "Get Help",
              svgSrc: "assets/icons/Help.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "FAQ",
              svgSrc: "assets/icons/FAQ.svg",
              press: () {},
              isShowDivider: false,
            ),
            const SizedBox(height: defaultPadding),

            // Log Out
            ListTile(
              onTap: () {},
              minLeadingWidth: 24,
              leading: SvgPicture.asset(
                "assets/icons/Logout.svg",
                height: 24,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  errorColor,
                  BlendMode.srcIn,
                ),
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(color: errorColor, fontSize: 14, height: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
