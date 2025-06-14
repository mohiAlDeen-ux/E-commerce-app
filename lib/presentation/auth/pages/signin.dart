import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/pages/bottom_nav_bar.dart';
import '../../../common/bloc/language/language_cubit.dart';
import '../../../common/bloc/language/language_state.dart';
import '../../../common/bloc/button/button_cubit.dart';
import '../../../common/bloc/task/task_state.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../common/widget/basic_reactive_button.dart';
import '../../../core/constant/constant.dart';
import '../../../domain/auth/usecase/signin_usecase.dart';
import '../../../common/bloc/error_masage/erorr_masage_cubit.dart';
import 'enter_emil_to_recover.dart';
import 'signup.dart';
import '../../../common/widget/error_masage.dart';
import '../widget/siginin_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final signinForm = LogInForm(formKey: _formKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonCubit()),
        BlocProvider(create: (context) => ErrorMasageCubit()),
      ],
      child: BlocListener<LanguageCubit, LanguageState>(
        listener: (context, state) {
          print(state);
        },
        child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              Image.asset(
                "assets/images/login_dark.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Log in with your data that you intered during your registration.",
                    ),
                    const SizedBox(height: defaultPadding),
                    signinForm.build(context),
                    ErrorMasage(),
                    Align(
                      child: TextButton(
                        child: const Text("Forgot password"),
                        onPressed: () {
                          AppNavigator.push(context, EnterEmilToRecoverPage());
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height > 700
                          ? size.height * 0.1
                          : defaultPadding,
                    ),
                    BlocListener<ButtonCubit, TaskState>(
                      listener: (context, state) {
                        if (state is FailureState) {
                          context
                              .read<ErrorMasageCubit>()
                              .showError(state.error);
                        } else if (state is SuccessState) {
                          AppNavigator.pushAndRemove(context, BottomNavBarPage());
                          context.read<ErrorMasageCubit>().showError("test");
                        }
                      },
                      child: Builder(builder: (context) {
                        return BasicReactiveButton(
                            title: "Log in ",
                            height: 30,
                            onPressed: () {
                              signinForm.getReq().fold((error) {}, (signinReq) {
                                context
                                    .read<ButtonCubit>()
                                    .execute(SigninUsecase(), signinReq);
                              });
                            });
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            AppNavigator.push(context, SignupPage());
                          },
                          child: const Text("Sign up"),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
