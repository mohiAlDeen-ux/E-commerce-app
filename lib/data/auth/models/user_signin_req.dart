class UserSigninReq {
  String email;
  String password;

UserSigninReq({required this.email, required this.password});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
