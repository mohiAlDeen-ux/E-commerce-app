class ResetPasswordPyOldPasswordReq {
  String oldPassword;
  String email;
  String newPassword;

  ResetPasswordPyOldPasswordReq({
    required this.oldPassword,
    required this.email,
    required this.newPassword
  });
}
