import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/assets/assets_depend_on_direction.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/widget/netword_image_with_loader.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/auth/entity/user_entity.dart';
import '../bloc/user_cubit.dart';
import '../skeleton/profile_card_skeleton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    this.proLableText = "Pro",
    this.press,
    this.isShowHi = true,
    this.isShowArrow = true,
  });

  final String proLableText;
  final bool isShowHi, isShowArrow;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, TaskState>(
      builder: (context2, state) {
        if (state is SuccessState){
        UserEntity user = state.data;
        return ListTile(
          onTap: press,
          leading: CircleAvatar(
            radius: 28,
            child: NetworkImageWithLoader(
              src: user.profileImage,
              radius: 100,
            ),
          ),
          title: Row(
            children: [
              Text(
                isShowHi ? "Hi, ${user.userName}" : user.userName,
                style: const TextStyle(fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: defaultPadding / 2),
              if (user.isPro)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2,
                      vertical: defaultPadding / 4),
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(defaultBorderRadious)),
                  ),
                  child: Text(
                    proLableText,
                    style: const TextStyle(
                      fontFamily: grandisExtendedFont,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 0.7,
                      height: 1,
                    ),
                  ),
                ),
            ],
          ),
          subtitle: Text(user.email),
          trailing: isShowArrow
              ? SvgPicture.asset(
                  AssetsDependOnDirection.getRow(context),
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.4),
                )
              : null,
        );
      }else{
        return ProfileCardSkeleton(isShowArrow: isShowArrow,);
      }
      }
    );
  }
}
