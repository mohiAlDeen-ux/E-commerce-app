import 'package:flutter/material.dart';
import '../../../common/helper/validat/validat.dart';
import '../../../core/constant/constant.dart';

// ignore: must_be_immutable
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
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              //floatingLabelBehavior: FloatingLabelBehavior.auto, // Show label only when focused
              //labelText: "User Name",
              hintText: "User Name",
              prefixIcon: Padding(
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