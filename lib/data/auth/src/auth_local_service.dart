import "package:dartz/dartz.dart";
import "package:shared_preferences/shared_preferences.dart";

abstract class AuthLocalService{
  Future<bool> isSavedToken();
  Future<Either> removeToken();
  Future<Either> saveToken(String token);
  Future<Either> getToken();

}

class AuthLocalServiceImp extends AuthLocalService{
 static const _tokenKey = "token";

  @override
  Future<bool> isSavedToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(_tokenKey);
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
      await sharedPreferences.setString(_tokenKey, token);
      return const Right("success");
    }catch(error){
      return Left(error.toString());
    }
  }
  
  @override
  Future<Either> getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.get(_tokenKey);
    if(token == null){
      return const Left("dont have save token");
    }else{
      return Right(token);
    }
  }

}