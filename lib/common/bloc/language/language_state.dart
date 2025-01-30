import 'package:flutter/material.dart';

class LanguageState{}

class LoadingState extends LanguageState{}

class LocalState extends LanguageState{
  final Locale locale;
  LocalState({required this.locale});
}
