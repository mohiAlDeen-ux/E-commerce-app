import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/helper/navigation/app_navigator.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/presentation/auth/widget/email_text_field.dart';

class ChooseVerificationMethod extends StatelessWidget {
  const ChooseVerificationMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            IconButton(
                onPressed: () {
                  AppNavigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: defaultPadding),
                    Text(
                      "Choose verification method",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: defaultPadding),
                    const Text(
                      "we'll send you a verification code to reset your password",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    Expanded(
                        child: EmailTextField(
                      onSavedFunction: null,
                    )),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}