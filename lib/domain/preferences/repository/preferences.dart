abstract class PreferencesRepository{
  Future<bool> isFirstTime();
  Future<void> setFirstTime();
}