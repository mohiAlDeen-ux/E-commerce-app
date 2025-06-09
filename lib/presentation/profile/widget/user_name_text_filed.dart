import 'package:flutter/material.dart';

import '../../../common/helper/validat/validat.dart';
import '../../../core/constant/constant.dart';
import '../../../generated/l10n.dart';

class UserNameTextFileld extends StatelessWidget {
  final String initialValue;

void Function(String?) onSavedFunction;

   UserNameTextFileld({super.key,required this.onSavedFunction, this.initialValue = ""});

  @override
  Widget build(BuildContext context) {
      return TextFormField(
            onSaved: onSavedFunction,
            validator: usernameValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            initialValue: initialValue,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
              ),

              hintText: S.of(context).user_name,
              prefixIcon: const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: Icon(
                  Icons.person_outlined,
              
                ),
              ),
            ),
          );
  }
}