import 'package:flutter/material.dart';
import '../bloc/error_masage/erorr_masage_cubit.dart';
import '../bloc/error_masage/erorr_masager_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorMasage extends StatelessWidget {
  final double fontSize;

  const ErrorMasage({
    super.key,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ErrorMasageCubit, ErrorMasageState>(
        builder: (context, state) {
          if (state is ErrorMasageShowState) {
            return AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: myText(state.errorMasage, fontSize),
            );
          } else {
            return AnimatedOpacity(
              opacity: 0.0,
              duration: const Duration(milliseconds: 500),
              child: myText(state.errorMasage, fontSize),
            );
          }
        },
      ),
    );
  }


  Widget myText(String errorMasage, double fontSize) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        errorMasage,
        style: TextStyle(color: Colors.red,fontSize: fontSize),
      ),
    );
  }
}
