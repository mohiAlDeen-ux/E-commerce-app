import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberTextFiled extends StatelessWidget {
  final String initialPhoneNumber;
  final void Function(String?) onSavedFunction;


  const PhoneNumberTextFiled({super.key, required this.initialPhoneNumber,required this.onSavedFunction});


  @override
  Widget build(BuildContext context){
    String initialValue;
    String initialCountryCode;
    try{
        PhoneNumber phoneNumber = PhoneNumber.fromCompleteNumber(completeNumber:  initialPhoneNumber);
        initialValue = phoneNumber.number;
        initialCountryCode = phoneNumber.countryCode;
    }catch(error){
        initialValue = "";
        initialCountryCode = "SY";
    }

    return IntlPhoneField(
      onSaved: (phoneNumber){
        onSavedFunction(phoneNumber?.completeNumber);
      },
      initialValue: initialValue,
      disableLengthCheck:false,
      decoration:  InputDecoration(
        hintText: S.of(context).phone_number,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: initialCountryCode, // Set default country code
      
      onChanged: (phone) {
      
      },
    );
  }
}
