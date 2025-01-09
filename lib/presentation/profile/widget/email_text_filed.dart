import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../common/helper/validat/validat.dart';
import '../../../core/constant/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
  final initialValue;
  void Function(String?) onSavedFunction;

  EmailTextField({super.key, required this.onSavedFunction, this.initialValue = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSavedFunction,
      validator: emaildValidator.call,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email address",
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
          child: SvgPicture.asset(
            "assets/icons/Message.svg",
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(1),
                BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
