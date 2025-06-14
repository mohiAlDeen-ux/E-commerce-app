import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/auth/usecase/reset_password_py_old_password.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_cubit.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../common/widget/basic_reactive_button.dart';
import '../../../core/constant/constant.dart';
import '../../../common/bloc/error_masage/erorr_masage_cubit.dart';
import '../../../common/widget/error_masage.dart';
import '../widget/reset_password_forms.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ResetPasswordForms resetPasswordForms =
        ResetPasswordForms(formKey: _formKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonCubit(),
        ),
        BlocProvider(
          create: (context) => ErrorMasageCubit(),
        ),
      ],
      child: BlocListener<ButtonCubit, TaskState>(
        listener: (context, buttonState) {
          if (buttonState is SuccessState) {
            print("navigator in reset password page to home page");
          } else if (buttonState is FailureState) {
            context
                .read<ErrorMasageCubit>()
                .showError(buttonState.error.toString());
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultPadding),
                IconButton(
                    onPressed: () {
                      AppNavigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding),
                        Text(
                          "Set new password",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        //const SizedBox(height: defaultPadding),
                        const Text(
                          "your new password must be diffrent from previosly used passwords.",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        resetPasswordForms,
                        const ErrorMasage(),
                        const Spacer(),
                        SizedBox(
                          height: 55,
                          child: Builder(builder: (context) {
                            return BasicReactiveButton(
                                onPressed: () {
                                  Either passwordReq = resetPasswordForms
                                      .getResetPasswordReq(); ///////////////
                                  passwordReq.fold((errorMasage) {
                                    if (errorMasage == "not equal") {
                                      context.read<ErrorMasageCubit>().showError(
                                          "the confirm password is not equal the password");
                                    }
                                  }, (returnedPassword) {
                                    context.read<ButtonCubit>().execute(
                                        getIt.call<
                                            ResetPasswordPyOldPasswordUseCase>(),
                                        returnedPassword);
                                  });
                                },
                                content: const Text("Change Password"));
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
