import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberTextFiled extends StatelessWidget {
  final String? initialPhoneNumber;
  final void Function(String?) onSavedFunction;

  const PhoneNumberTextFiled(
      {super.key,
      required this.initialPhoneNumber,
      required this.onSavedFunction});

  @override
  Widget build(BuildContext context) {
    String initialValue;
    String countryISOCode;
    try {
      if (initialPhoneNumber != null) {
        PhoneNumber phoneNumber =PhoneNumber.fromCompleteNumber(completeNumber: initialPhoneNumber!);
        initialValue = phoneNumber.number;
        countryISOCode = phoneNumber.countryISOCode;
        print(countryISOCode);
      } else {
        initialValue = "";
        countryISOCode = "SY";
      }
    } catch (error) {
      initialValue = "";
      countryISOCode = "SY";
    }

    return IntlPhoneField(
      onSaved: (phoneNumber) {
        onSavedFunction(phoneNumber?.completeNumber);
      },
      initialValue: initialValue,
      disableLengthCheck: false,
      decoration: InputDecoration(
        hintText: S.of(context).phone_number,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: countryISOCode, // Set default country code
      onChanged: (phone) {},
    );
  }
}
