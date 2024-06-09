import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

 const String kEn = 'en';
 const String kAr = 'ar';
class AppLanguageConfig {

  static String pathLang = 'assets/lang';


  static Locale enLocal = const Locale(kEn);
  static Locale arLocal = const Locale(kAr);

  static List<Locale> supportLocal = [enLocal,arLocal];

///[currentlanguage] `en` or `ar`
  static String currentLanguage(BuildContext context){
  return  context.locale.languageCode;
  }
}