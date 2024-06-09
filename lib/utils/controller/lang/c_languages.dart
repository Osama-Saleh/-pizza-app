part of '../../import_paths/import_paths.dart';

enum ChoiceLanguage {
  ar('arabic'),
  en('english');
  // String get title {
  //   switch (this) {
  //     case ChoiceLanguage.ar:
  //       return 'arabic';
  //     case ChoiceLanguage.en:
  //       return 'english';
  //     default:
  //       return '';
  //   }
  // }

  final String nameLang;
  const ChoiceLanguage(this.nameLang);
}

class ControllerLanguages extends ChangeNotifier {
  ChoiceLanguage? lang;

  List<ChoiceLanguage> itemLanguage = [ChoiceLanguage.ar, ChoiceLanguage.en];

  void changeLang(BuildContext context, {required ChoiceLanguage lang}) {
    if (this.lang != lang) {
      /// [setLocal] change language
      context.setLocale(lang == ChoiceLanguage.en
          ? AppLanguageConfig.enLocal
          : AppLanguageConfig.arLocal); 
      // AppReStartApplication.reBuild(context);
    }
    // notifyListeners();
  }

  ///[changeLanguage] check language depended on  lang device
  void checkLang(BuildContext context) {
    lang = AppLanguageConfig.currentLanguage(context) == kEn
        ? ChoiceLanguage.en
        : ChoiceLanguage.ar;
    notifyListeners();
  }
}
