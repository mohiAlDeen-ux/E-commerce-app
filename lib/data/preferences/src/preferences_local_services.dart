import "package:dartz/dartz.dart";
import "package:shared_preferences/shared_preferences.dart";


abstract class PreferencesLocalServices{
  Future<void> saveVersion(String version);
  Future<Either> getVersion();
}

class PreferencesLocalServicesImp extends PreferencesLocalServices{

  static const _versionKey = "version";

  @override
  Future<Either> getVersion() async{
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    final version = sharedPreferences.get(_versionKey);
    if(version == null){
      return const Left("no version saved yet");
    }else{
      return Right(version);
    }

  }
  
  @override
  Future<void> saveVersion(String version) async{
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    sharedPreferences.setString(_versionKey, version);
  }
  
}