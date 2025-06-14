import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/profile/pages/reset_password.dart';
import '../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:intl/intl.dart";

import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';
import '../bloc/user_cubit.dart';
import '../widget/profile_card.dart';
import 'edit_profile.dart';
import '../../../domain/auth/entity/gender.dart';



class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: BlocBuilder<UserCubit, TaskState>(
            builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () => AppNavigator.pop(context),
                                    icon: const Icon(Icons.arrow_back)),
                              ],
                            ),
                          ),
                          Text(S.of(context).profile,
                              style: Theme.of(context).textTheme.titleSmall),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Builder(builder: (context) {
                                  return TextButton(
                                    onPressed: () {
                                      if(state is SuccessState){
                                      AppNavigator.push(
                                          context,
                                          BlocProvider.value(
                                            value: context.read<UserCubit>(),
                                            child: const EditProfile(),
                                            ));
                                            }
                                    },
                                    child: Text(S.of(context).edit),
                                  );
                                }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: defaultPadding,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: ProfileCard(
                        isShowArrow: false,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: defaultPadding,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProfileInfoListTile(
                        infoName: S.of(context).name,
                        value: Text(state is SuccessState ? state.data.userName: "",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProfileInfoListTile(
                        infoName: S.of(context).date_of_birth,
                        value: Text(
                            state is SuccessState && state.data.birthDate != null ? DateFormat.yMMMd('en_US')
                                .format(state.data.birthDate)
                                .toString():"",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProfileInfoListTile(
                        infoName: S.of(context).phone_number,
                        value: Text(state is SuccessState && state.data.phoneNumber != null ? state.data.phoneNumber:" ",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProfileInfoListTile(
                        infoName: S.of(context).gender,
                        value: Text(state is SuccessState ? GenderType.values[GenderType.values.indexOf(state.data.gender)].toShortString():"", //what is this
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProfileInfoListTile(
                        infoName: S.of(context).email,
                        value: Text(state is SuccessState ? state.data.email:"",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ProfileInfoListTile(
                        showBottomDivider: false,
                        infoName: S.of(context).password,
                        value: TextButton(
                          onPressed: () {
                            AppNavigator.push(context,ResetPasswordPage());
                          },
                          style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                          child: Text(
                            S.of(context).change_password,
                            style: const TextStyle(),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              
            },
          ),
        ),
      ),
    );
  }
}

class ProfileInfoListTile extends StatelessWidget {
  final bool showBottomDivider;
  final String infoName;
  final Widget value;

  const ProfileInfoListTile(
      {super.key,
      this.showBottomDivider = true,
      required this.infoName,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            infoName,
            style: const TextStyle(fontSize: 15, color: Colors.black26),
          ),
          trailing: value,
          //trailing: Text(value, style: Theme.of(context).textTheme.titleSmall),
        ),
        if (showBottomDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Divider(
              height: 0.2,
              thickness: 0.25,
            ),
          )
      ],
    );
  }
}
