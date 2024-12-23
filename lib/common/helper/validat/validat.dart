import 'package:form_field_validator/form_field_validator.dart';


final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final emaildValidator = MultiValidator([

  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address"),
]);

final usernameValidator = MultiValidator([
  RequiredValidator(errorText: "User name is required"),
  MinLengthValidator(8, errorText: 'User name must be at least 8 digits long')
]);