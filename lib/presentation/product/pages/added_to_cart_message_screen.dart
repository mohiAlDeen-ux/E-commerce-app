import 'package:flutter/material.dart';
import '../../../core/constant/constant.dart';
import '../../../generated/l10n.dart';

class AddedToCartMessageScreen extends StatelessWidget {
  const AddedToCartMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? "assets/Illustration/success.png"
                    : "assets/Illustration/success_dark.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Spacer(flex: 2),
              Text(
                S.of(context).add_to_cart,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                S.of(context).click_the_checkout_button_to_complete_the_purchase_process,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).continue_shopping),
              ),
              const SizedBox(height: defaultPadding),
              ElevatedButton(
                onPressed: () {},
                child: Text(S.of(context).check_out),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
