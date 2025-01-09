import 'package:flutter/material.dart';
import '../bloc/verification_code_cubit.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class VerificationCodeInput extends StatefulWidget {
  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final int codeLength = 6;
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < codeLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < codeLength - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    _updateCode();
  }

  void _updateCode() {
    final code = _controllers.map((controller) => controller.text).toList();
    context.read<VerificationCodeCubit>().updateCode(code);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCodeCubit, List<String>>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(codeLength, (index) {
              return Container(
                width: MediaQuery.of(context).size.width / codeLength - 18,
                margin: EdgeInsets.only(right: index == codeLength - 1 ? 0 : 8),
                child: TextFormField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _onChanged(value, index),
                  onFieldSubmitted: (_) {
                    if (index < codeLength - 1) {
                      FocusScope.of(context)
                          .requestFocus(_focusNodes[index + 1]);
                    }
                  },
                ),
              );
            }),
          );
        },
    );
  }
}
