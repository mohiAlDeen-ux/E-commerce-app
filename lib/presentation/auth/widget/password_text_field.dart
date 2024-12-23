import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/common/helper/validat/validat.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {

void Function(String?)? onSavedFunction;
TextEditingController? controller;

String hintText;
  PasswordTextField({super.key, required this.onSavedFunction, this.hintText =  "Password", this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            controller: controller,
            onSaved: onSavedFunction,  
            validator: passwordValidator.call,
            obscureText: true,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Lock.svg",
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.3),
                      BlendMode.srcIn),
                ),
              ),
            ),
          );
  }
}