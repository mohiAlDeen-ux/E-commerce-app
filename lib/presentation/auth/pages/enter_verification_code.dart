// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import '../../../common/bloc/button/button_cubit.dart';
// import '../../../common/bloc/task/task_state.dart';
// import '../../../common/helper/navigation/app_navigator.dart';
// import '../../../common/widget/basic_reactive_button.dart';
// import '../../../core/constant/constant.dart';
// import '../../../common/bloc/error_masage/erorr_masage_cubit.dart';
// import '../bloc/timer_cubit.dart';
// import '../bloc/timer_state.dart';
// import '../bloc/verification_code_cubit.dart';
// import 'reset_password.dart';
// import '../../../common/widget/error_masage.dart';
// import '../widget/verification_code_input.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EnterVerificationCode extends StatefulWidget {
//   final String email;
//   const EnterVerificationCode({super.key, required this.email});

//   @override
//   State<EnterVerificationCode> createState() => _EnterVerificationCodeState();
// }

// class _EnterVerificationCodeState extends State<EnterVerificationCode> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => TimerCubit()),
//         BlocProvider(create: (context) => VerificationCodeCubit()),
//         BlocProvider(create: (context) => ErrorMasageCubit())
//       ],
//       child: BlocBuilder<TimerCubit, TimerState>(
//         builder: (context, timerState) {
//           return BlocBuilder<VerificationCodeCubit, List<String>>(
//             builder: (context, verificationCodeState) {
//               return Scaffold(
//                 body: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: defaultPadding),
//                       IconButton(
//                           onPressed: () {
//                             AppNavigator.pop(context);
//                           },
//                           icon: const Icon(Icons.arrow_back)),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.asset("assets/illustration/Password.png"),
//                               const SizedBox(height: defaultPadding),
//                               Text(
//                                 "Verification code",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleLarge!
//                                     .copyWith(fontWeight: FontWeight.w500),
//                               ),
//                               const SizedBox(height: defaultPadding),
//                               Text.rich(TextSpan(
//                                   text:
//                                       "We have sent the code verification \nto ",
//                                   style: const TextStyle(fontSize: 15),
//                                   children: [
//                                     TextSpan(
//                                         text: widget.email,
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black)),
//                                     TextSpan(
//                                         recognizer: TapGestureRecognizer()
//                                           ..onTap = () {
//                                             AppNavigator.pop(context);
//                                           },
//                                         text: " Change email?",
//                                         style: TextStyle(
//                                             color:
//                                                 Theme.of(context).primaryColor))
//                                   ])),
//                               const SizedBox(
//                                 height: defaultPadding * 1,
//                               ),
//                               VerificationCodeInput(),
//                               const SizedBox(
//                                 height: defaultPadding,
//                               ),
//                               if (timerState is TimerWatingState)
//                                 SizedBox(
//                                     width: double.infinity,
//                                     child: Center(
//                                         child: Text.rich(TextSpan(
//                                             text: "Resend code after",
//                                             children: [
//                                           TextSpan(
//                                               text:
//                                                   " ${timerState.remainingTime.minute.toString().padLeft(2, '0')}:${timerState.remainingTime.second.toString().padLeft(2, '0')}",
//                                               style: TextStyle(
//                                                   color: Theme.of(context)
//                                                       .primaryColor))
//                                         ])))),
//                               ErrorMasage(),
//                               const Spacer(),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: BlocProvider(
//                                       create: (context) => ButtonCubit(),
//                                       child: BlocListener<ButtonCubit,
//                                           TaskState>(
//                                         listener: (context, buttonState) {
//                                           if(buttonState is SuccessState){
//                                             context.read<TimerCubit>().reste();
//                                           }else if(buttonState is FailureState){
//                                             context.read<ErrorMasageCubit>().showError(buttonState.error);
//                                           }
//                                         },
//                                         child: Builder(builder: (context) {
//                                           return BasicReactiveButton(
//                                             onPressed:
//                                                 timerState is TimerWatingState
//                                                     ? null
//                                                     : () async {
//                                                         // await context
//                                                         //     .read<ButtonCubit>()
//                                                         //     .execute(
//                                                         //         SentVerificationCodeUsecase(),
//                                                         //         widget.email,);
//                                                       },
//                                             height: 30,
//                                             content: const Text("Resend"),
//                                           );
//                                         }),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: defaultPadding,
//                                   ),
//                                   Expanded(
//                                     child: BlocProvider(
//                                       create: (context) => ButtonCubit(),
//                                       child: BlocListener<ButtonCubit,
//                                           TaskState>(
//                                         listener: (context, buttonState) {
//                                           if(buttonState is SuccessState){
//                                             AppNavigator.push(context, ResetPassword(token: buttonState.data));
//                                           }else if(buttonState is FailureState){
//                                             context.read<ErrorMasageCubit>().showError(buttonState.error);
//                                           }
//                                         },
//                                         child: Builder(builder: (context) {
//                                           return BasicReactiveButton(
//                                             onPressed: () {
//                                               String code =
//                                                   verificationCodeState
//                                                       .join("");
//                                               if (code.length == 6) {
//                                                 // context.read<ButtonCubit>().execute(
//                                                 //     ConfirmVerificationCodeUsecase(),
//                                                 //     ConfirmVerificationCodeReq(
//                                                 //         email: widget.email,
//                                                 //         code: code),);
//                                               } else {
//                                                 context.read<ErrorMasageCubit>().showError("please enter the corect code");
//                                               }
//                                             },
//                                             height: 30,
//                                             content: const Text("Confirm"),
//                                           );
//                                         }),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
