import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bottomNavBar/pages/bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helper/navigation/app_navigator.dart';
import '../../auth/pages/signin.dart';
import '../../on_board/pages/on_board.dart';
import '../bloc/spash_cubit.dart';
import '../bloc/spash_state.dart';

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
            print("i am auth");
            AppNavigator.pushAndRemove(context, BottomNavBarPage());

          }else if(state is UnAuthState){
            AppNavigator.pushAndRemove(context, const SigninPage());

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
