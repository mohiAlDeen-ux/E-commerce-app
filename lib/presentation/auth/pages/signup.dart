import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/button/button_cubit.dart';
import 'package:flutter_application_1/common/bloc/button/button_state.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/common/widget/basic_reactive_button.dart';
import 'package:flutter_application_1/core/config/theme/app_colors.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/data/auth/models/user_creational_req.dart';
import 'package:flutter_application_1/domain/auth/usecase/signup_usecase.dart';
import 'package:flutter_application_1/presentation/auth/bloc/checkbox_cubit.dart';
import 'package:flutter_application_1/presentation/auth/bloc/erorr_masage_cubit.dart';
import 'package:flutter_application_1/presentation/auth/pages/signin.dart';
import 'package:flutter_application_1/presentation/auth/widget/error_masage.dart';
import 'package:flutter_application_1/presentation/auth/widget/siginup_forms.dart';
import 'package:flutter_application_1/presentation/on_board/pages/on_board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart' as dartz;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpForm _signUpForm = SignUpForm(formKey: _formKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonCubit(),
        ),
        BlocProvider(create: (context) => ErrorMasageCubit()),
        BlocProvider(create: (context) => CheckboxCubit())
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/signUp_dark.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's Get Started!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Text(
                        "Please enter your valid data in order to create an account."),
                    const SizedBox(height: defaultPadding),
                    _signUpForm.build(context),
                    //const SizedBox(height: defaultPadding),
                    ErrorMasage(
                      altWidget: const SizedBox(height: defaultPadding),
                    ),
                    Row(
                      children: [
                        BlocBuilder<CheckboxCubit, bool>(
                          builder: (context, isChecked) {
                            return Checkbox(
                              onChanged: (value) {
                                context.read<CheckboxCubit>().toggleState();
                              },
                              value: isChecked,
                            );
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "I agree with the",
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      AppNavigator.pushAndRemove(
                                          context, const OnBoardPage());
                                    },
                                  text: " Terms of service ",
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(
                                  text: "& privacy policy.",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    BlocListener<ButtonCubit, ButtonState>(
                        listener: (context, state) {
                      if (state is ButtonSuccessState) {
                        //AppNavigator
                      } else if (state is ButtonFailureState) {
                        context
                            .read<ErrorMasageCubit>()
                            .showError(state.errorMessage);
                      }
                    }, child: Builder(builder: (context) {
                      return BlocBuilder<CheckboxCubit, bool>(
                        builder: (context, checkboxState) {
                          return BasicReactiveButton(
                              height: 30,
                              content: const Text("Continue"),
                              onPressed: checkboxState ?() {
                                dartz.Either<String, UserCreationalReq> req =
                                    _signUpForm.getReq();
                                req.fold((error) {
                                  // print("erorr3");
                                }, (data) {
                                  context
                                      .read<ButtonCubit>()
                                      .execute(data, SignupUsecase());
                                });
                              } : null);
                        },
                      );
                    })),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(
                          onPressed: () {
                            AppNavigator.push(context, const Signin());
                          },
                          child: const Text("Log in"),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
