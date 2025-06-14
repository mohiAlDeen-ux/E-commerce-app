import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/auth/pages/signin.dart';
import '../../../common/helper/navigation/app_navigator.dart';
import '../../../core/constant/constant.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

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
                      "Password reset message sent successfully",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: defaultPadding),
                    const Text(
                      "We have sent you a password reset email. Please check your email to reset your password.",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: defaultPadding * 2,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        AppNavigator.push(context, const SigninPage());
                      },
                      child: const Text("OK"),
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