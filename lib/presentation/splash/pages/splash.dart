import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/presentation/auth/pages/signin.dart';
import 'package:flutter_application_1/presentation/on_board/pages/on_board.dart';
import 'package:flutter_application_1/presentation/splash/bloc/spash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/presentation/splash/bloc/spash_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..appStrted(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is FirstTimeState){
            AppNavigator.pushReplacement(context, const OnBoardPage());
            
          }else if(state is AuthState){
            AppNavigator.pushAndRemove(context, const BottomAppBar());

          }else if(state is UnAuthState){
            AppNavigator.pushAndRemove(context, const Signin());

          }
        },
        child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: SvgPicture.asset(
            "assets/icons/logo.svg"
          ),
        ),
      ),
      ),
    );
  }
}
