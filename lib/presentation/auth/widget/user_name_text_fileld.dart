import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/helper/validat/validat.dart';
import 'package:flutter_application_1/core/constant/constant.dart';

// ignore: must_be_immutable
class UserNameTextFileld extends StatelessWidget {
void Function(String?)? onSavedFunction;

   UserNameTextFileld({super.key,required this.onSavedFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            onSaved: onSavedFunction,
            validator: usernameValidator.call,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              hintText: "User name",
              prefixIcon: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: Icon(
                  Icons.person_outlined,
                  grade: 100,
                  color: Color.fromARGB(255, 181, 175, 175)
                ),
              ),
            ),
          );
  }
}