class UserCreationalReq {
  String email;
  String password;
  String userName;

UserCreationalReq({
  required this.email,
  required this.userName,
  required this.password});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': userName,
      'password': password,
    };
  }
}
