import "package:dartz/dartz.dart";
import "package:shared_preferences/shared_preferences.dart";

abstract class AuthLocalService{
  Future<bool> isSavedToken();
  Future<Either> removeToken();
  Future<Either> saveToken(String token);

}

class AuthLocalServiceImp extends AuthLocalService{
  @override
  Future<bool> isSavedToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get("token");
    if(token == null){
      return false;
    }else{
      return true;
    }
  }

  @override
  Future<Either> removeToken() async{
    try{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return const Right("success");
    }catch(error){
      return left(error);
    }

  }
  
  @override
  Future<Either> saveToken(String token) async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("token", token);
      return const Right("success");
    }catch(error){
      return Left(error.toString());
    }
  }

}