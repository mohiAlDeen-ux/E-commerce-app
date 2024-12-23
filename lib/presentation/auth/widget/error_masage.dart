import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/auth/bloc/erorr_masage_cubit.dart';
import 'package:flutter_application_1/presentation/auth/bloc/erorr_masager_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorMasage extends StatelessWidget {
Widget? altWidget;

  ErrorMasage({super.key, this.altWidget});

  @override
  Widget build(BuildContext context) {
     return Center(
       child: BlocBuilder<ErrorMasageCubit, ErrorMasageState>(
         builder: (context, state) {
           if (state is ErrorMasageShowState) {
             return AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(state.ErrorMasage, style: const TextStyle(color: Colors.red), ),
                ),
              ); } else {
                 return AnimatedOpacity( opacity: 0.0, duration: const Duration(milliseconds: 500),
                  child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(state.ErrorMasage, style: const TextStyle(color: Colors.red), ),
                ),
                  ); 
             } 
           }, 
         ),
     ); 
     }
  }
                 
//Widget build(BuildContext context) {
/*  return BlocBuilder<ErrorMasageCubit, ErrorMasageState>(
      builder: (context, errorMasageState) {
    return Center(
      child: AnimatedOpacity(
        opacity: errorMasageState is ErrorMasageShowState ? 1.0 : 0.0,
        duration: const Duration(microseconds: 100),
        child: errorMasageState is ErrorMasageShowState
            ? Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  errorMasageState.ErorrMasage,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : altWidget ?? const SizedBox.shrink(),
      ),
    );
  });
*/
