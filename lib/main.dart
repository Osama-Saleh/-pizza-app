import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/utils/controller/auth_controller/singup_controller.dart';
import 'package:pizza_app/utils/controller/lang/app_lang.dart';
import 'package:pizza_app/utils/import_paths/import_paths.dart';
import 'package:provider/provider.dart';

import 'utils/controller/home_controller/home_constroller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB3DY2WVTo4w5Gx1tibNdo98Tu_mbDh64M',
    appId: '1:1079427152272:android:b50914f3cca749e7fb5b15',
    messagingSenderId: '1079427152272',
    projectId: 'pizza-c218c',
    storageBucket: 'pizza-c218c.appspot.com',
  ));
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginController>(
        create: (_) => LoginController(),
      ),
      ChangeNotifierProvider<SingUpController>(
        create: (_) => SingUpController(),
      ),
      ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(),
      ),
      ChangeNotifierProvider<ControllerLanguages>(
        create: (_) => ControllerLanguages(),
      ),
    ],
    child: EasyLocalization(
      child: StartApp(),
      supportedLocales: AppLanguageConfig.supportLocal,
      path: AppLanguageConfig.pathLang,
    ),
  ));
}
