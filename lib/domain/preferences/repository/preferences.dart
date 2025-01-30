import 'package:dartz/dartz.dart';

abstract class PreferencesRepository{
  Future<bool> isFirstTime();
  Future<void> setFirstTime();
  Future<String> getLanguage();
  Future<void> setLanguage(String language); 
}