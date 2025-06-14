import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/pages/bottom_nav_bar.dart';
import '../../../common/bloc/button/button_cubit.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../common/widget/basic_reactive_button.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/constant/constant.dart';
import '../../../data/auth/models/user_creational_req.dart';
import '../../../domain/auth/usecase/signup_usecase.dart';
import '../bloc/checkbox_cubit.dart';
import '../../../common/bloc/error_masage/erorr_masage_cubit.dart';
import 'signin.dart';
import '../../../common/widget/error_masage.dart';
import '../widget/siginup_forms.dart';
import '../../on_board/pages/on_board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart' show Either;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                    const ErrorMasage(),
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
                    BlocListener<ButtonCubit, TaskState>(
                        listener: (context, state) {
                      if (state is SuccessState) {
                        AppNavigator.pushAndRemove(context, BottomNavBarPage());
                      } else if (state is FailureState) {
                        context
                            .read<ErrorMasageCubit>()
                            .showError(state.error);
                      }
                    }, child: Builder(builder: (context) {
                      return BlocBuilder<CheckboxCubit, bool>(
                        builder: (context, checkboxState) {
                          return BasicReactiveButton(
                              height: 30,
                              content: const Text("Continue"),
                              onPressed: checkboxState ?() {
                                Either<String, UserCreationalReq> req =
                                    _signUpForm.getReq();
                                req.fold((error) {
                                  // print("erorr3");
                                }, (data) {
                                  context
                                      .read<ButtonCubit>()
                                      .execute(SignupUsecase(),data);
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
                            AppNavigator.push(context, const SigninPage());
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
