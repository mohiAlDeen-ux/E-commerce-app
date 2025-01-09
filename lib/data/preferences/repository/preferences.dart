import 'package:package_info_plus/package_info_plus.dart';

import '../../../domain/preferences/repository/preferences.dart';
import '../../../servise_locator.dart';
import '../src/preferences_local_services.dart';



class PreferencesRepositoryImp extends PreferencesRepository{

  

  @override
  Future<bool> isFirstTime() async{
    final currentVersion = (await PackageInfo.fromPlatform()).version;

    final savedVersion = await getIt.call<PreferencesLocalServices>().getVersion();
    return savedVersion.fold((error){
      return true;
    }, (savedVersionValue){
      return savedVersionValue == currentVersion;
    });
  }

  @override
  Future<void> setFirstTime() async{
    final currentVersion = (await PackageInfo.fromPlatform()).version;

    getIt.call<PreferencesLocalServices>().saveVersion(currentVersion);
  }
  
}