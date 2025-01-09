import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/button/button_cubit.dart';
import 'package:flutter_application_1/common/bloc/error_masage/erorr_masage_cubit.dart';
import 'package:flutter_application_1/common/widget/basic_reactive_button.dart';
import 'package:flutter_application_1/common/widget/error_masage.dart';
import 'package:flutter_application_1/presentation/profile/widget/profile_image_with_edit_button.dart';
import 'package:flutter_application_1/presentation/profile/widget/select_photo_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/image_picker/image_picker_service.dart';
import '../../../domain/auth/usecase/set_user_info_usecase.dart';
import '../bloc/image_cubit.dart';
import '../bloc/image_state.dart';
import '../bloc/user_cubit.dart';
import '../widget/edit_profile_form.dart';
import '../../../servise_locator.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
  });

  Future<void> _showSelectPhotoOptions(
      BuildContext context, void Function(File) onfinished) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (_) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: (ImageSource imageSource) async {
                  final Either selecteImage =
                      await MyImagePicker.pickImage(imageSource);
                  selecteImage.fold((ifLeft) {}, (image) {
                    onfinished(image);
                  });
                },
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final userState = context.watch<UserCubit>().state;
    final editProfileForm = EditProfileForm(
      formKey: _formKey,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => ErrorMasageCubit(),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: CustomScrollView(
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
                    Text("Profile",
                        style: Theme.of(context).textTheme.titleSmall),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Builder(builder: (context) {
                            return IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.info_outline));
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
              )),
              if (userState is SuccessState)
                SliverToBoxAdapter(
                  child: Builder(builder: (context) {
                    return ProfileImageWithEditButton(
                      onEditTap: () =>
                          _showSelectPhotoOptions(context, (File image) {
                        context.read<ImageCubit>().selecteImage(image);
                        AppNavigator.pop(context);
                      }),
                      image: userState.data.profileImage,
                    );
                  }),
                )
              else
                const SliverToBoxAdapter(
                    child: CircularProgressIndicator.adaptive()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: defaultPadding * 1.5,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                    child: Text(
                  "Edit Photo",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).primaryColor),
                )),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: defaultPadding,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: editProfileForm,
                ),
              ),
              const SliverToBoxAdapter(
                child: ErrorMasage(),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            height: 60,
            child: BlocProvider(
              create: (context) => ButtonCubit(),
              child: Builder(builder: (context) {
                return BlocListener<ButtonCubit, TaskState>(
                  listener: (context, state) {
                    if (state is FailureState) {
                      context.read<ErrorMasageCubit>().showError(state.error);
                    }else if(state is SuccessState){
                      context.read<UserCubit>().getUser();
                     //print("in mid");
                      AppNavigator.pop(context);
                    }
                  },
                  child: BasicReactiveButton(
                    onPressed: () {
                      Either setUserInfoReq = editProfileForm.getReq();
                      setUserInfoReq.map((data) {
                        final imageState = context.read<ImageCubit>().state;
                        if (imageState is ExistImage) {
                          data.profileImage = imageState.image;
                        }
                        context
                            .read<ButtonCubit>()
                            .execute(getIt.call<SetUserInfoUsecase>(), data);
                      });
                    },
                    content: const Text("Done"),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
