import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/language/language_cubit.dart';
import 'package:flutter_application_1/domain/auth/entity/gender.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application_1/generated/l10n.dart';

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
            Builder(builder: (context) {
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
            }),

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
                        child: const AspectRatio(
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
            const SizedBox(
              height: defaultPadding,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                S.of(context).account,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            ProfileMenuListTile(
              text: S.of(context).orders,
              svgSrc: "assets/icons/Order.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).returns,
              svgSrc: "assets/icons/Return.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).wishlist,
              svgSrc: "assets/icons/Wishlist.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).addresses,
              svgSrc: "assets/icons/Address.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).payment,
              svgSrc: "assets/icons/card.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).wallet,
              svgSrc: "assets/icons/Wallet.svg",
              press: () {},
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                S.of(context).personalization,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            DividerListTileWithTrilingText(
              svgSrc: "assets/icons/Notification.svg",
              title: S.of(context).notification,
              trilingText: S.of(context).off,
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).preferences,
              svgSrc: "assets/icons/Preferences.svg",
              press: () {},
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                S.of(context).settings,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: S.of(context).language,
              svgSrc: "assets/icons/Language.svg",
              press: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: defaultPadding),
                                  child: Text(
                                    "Select Language",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              const Divider(),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: S.delegate.supportedLocales.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final localCode = S.delegate
                                        .supportedLocales[index].languageCode;
                                    late final localName;
                                    switch (localCode) {
                                      case 'ar':
                                        localName = "عربي";
                                      case 'en':
                                        localName = "ُEnglish";
                                    }
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(localName),
                                          onTap: () {
                                            context
                                                .read<LanguageCubit>()
                                                .setLanguage(localCode);

                                            AppNavigator.pop(context);
                                          },
                                        ),
                                        const Divider(
                                          height: 5,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ));
              },
            ),
            ProfileMenuListTile(
              text: S.of(context).location,
              svgSrc: "assets/icons/Location.svg",
              press: () {},
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                S.of(context).help_and_support,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: S.of(context).get_help,
              svgSrc: "assets/icons/Help.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: S.of(context).faq,
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
              title: Text(
                S.of(context).log_out,
                style:
                    const TextStyle(color: errorColor, fontSize: 14, height: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
