import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/bloc/button/button_cubit.dart';
import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/common/widget/basic_reactive_button.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/domain/auth/usecase/sent_verification_code_usecase.dart';
import 'package:flutter_application_1/presentation/auth/bloc/erorr_masage_cubit.dart';
import 'package:flutter_application_1/presentation/auth/pages/enter_verification_code.dart';
import 'package:flutter_application_1/presentation/auth/widget/email_text_field.dart';
import 'package:flutter_application_1/presentation/auth/widget/error_masage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:dartz/dartz.dart';

class EnterEmilToRecover extends StatelessWidget {
  EnterEmilToRecover({super.key});
  final formKey = GlobalKey<FormState>();
  String? email;

  void saveFunction(String? email) {
    this.email = email;
    print(email);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonCubit(),
        ),
        BlocProvider(
          create: (context) => ErrorMasageCubit()
        ),
      ],
      child: BlocListener<ButtonCubit, TaskState>(
        listener: (context, state) {
          if(state is SuccessState){
           //print(email);
           AppNavigator.push(
           context, EnterVerificationCode(email: email!,));
          }else if(state is FailureState){
            print(state.error);
            context.read<ErrorMasageCubit>().showError(state.error);
          }
        }
        ,
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding),
                        Text(
                          "Password recovery",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: defaultPadding),
                        const Text(
                          "Enter your E-mail address recover to your password",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: defaultPadding * 2,
                        ),
                        Expanded(
                            child: Form(
                          key: formKey,
                          child: EmailTextField(
                            onSavedFunction: saveFunction,
                          ),
                        )),
                        const Spacer(),
                        Builder(builder: (context) {
                          return BasicReactiveButton(
                              height: 30,
                              content: const Text("Next"),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context.read<ButtonCubit>().execute(SentVerificationCodeUsecase(),email!);
                                }
                              });
                        }),
                        ErrorMasage()
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
