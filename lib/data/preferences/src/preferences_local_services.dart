import "package:dartz/dartz.dart";
import "package:shared_preferences/shared_preferences.dart";


abstract class PreferencesLocalServices{
  Future<void> saveVersion(String version);
  Future<Either> getVersion();
  Future<Either> getLanguage();
  Future<void> setLanguage(String language); 
}

class PreferencesLocalServicesImp extends PreferencesLocalServices{

  static const _versionKey = "version";
  static const _languageKey = "language";

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
  
  @override
  Future<Either> getLanguage() async{
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
   
    final language = sharedPreferences.getString(_languageKey);
    if (language == null){
      return const Left("no saved language");
    }else{
      return Right(language);
    }
     
  }
  
  @override
  Future<void> setLanguage(String language) async{ 
    SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    sharedPreferences.setString(_languageKey, language);
  }
  
}