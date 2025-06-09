import 'package:flutter/material.dart';
import 'common/bloc/internet/internet_cubit.dart';
import 'common/bloc/language/language_cubit.dart';
import 'common/bloc/language/language_state.dart';
import 'domain/preferences/usecase/get_language_usecase.dart';
import 'generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/config/theme/app_theme.dart';
import 'presentation/bottomNavBar/pages/buttomNavBar.dart';
import 'presentation/splash/pages/splash.dart';
import 'servise_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  await setupServiceLocator();

  final languageCode =  await getIt.call<GetLanguageUsecase>().call();
  final locale = Locale(languageCode);

  runApp(MyApp(
    initialLocale: locale,
  ));
}



class MyApp extends StatelessWidget {
  final Locale initialLocale;
  const MyApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit()..monitorInternetConnection(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          Locale? locale;
          if (state is LocalState) {
            locale = state.locale;
          } else {
            locale = initialLocale;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
               S.delegate,
               GlobalMaterialLocalizations.delegate, 
               GlobalWidgetsLocalizations.delegate, 
               GlobalCupertinoLocalizations.delegate, 
            ],

            title: 'E-commerce app',
            theme: AppTheme.lightTheme(context),
            home: BottomNavBarPage(),
          );
        },
      ),
    );
  }
}
