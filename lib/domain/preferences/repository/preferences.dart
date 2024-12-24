import "package:dartz/dartz.dart";

abstract class PreferencesRepository{
  Future<bool> isFirstTime();
  Future<void> setFirstTime();
}