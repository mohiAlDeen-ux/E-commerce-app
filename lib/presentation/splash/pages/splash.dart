import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/presentation/on_board/pages/on_board.dart';
import 'package:flutter_application_1/presentation/splash/bloc/spash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/presentation/splash/bloc/spash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..appStrted(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is FirstTimeState){
            AppNavigator.pushReplacement(context, OnBoardPage());
            
          }else if(state is AuthState){


          }else if(state is UnAuthState){
        

          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Splash"),
          ),
        ),
      ),
    );
  }
}
