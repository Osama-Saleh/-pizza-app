import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/utils/import_paths/import_paths.dart';
import 'package:provider/provider.dart';

class LangUI extends StatefulWidget {
  const LangUI({super.key});

  @override
  State<LangUI> createState() => _LangUIState();
}

class _LangUIState extends State<LangUI> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var pLang = Provider.of<ControllerLanguages>(context, listen: false);
      pLang.checkLang(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pLang = Provider.of<ControllerLanguages>(context);
    return DropdownButton(
      value: pLang.lang,
      items: pLang.itemLanguage
          .map(
            (language) => DropdownMenuItem(
              value: language,
              child: Text(language.nameLang.tr()),
            ),
          )
          .toList(),
      onChanged: (value) {
        pLang.changeLang(context, lang: value ?? ChoiceLanguage.en);
      },
    );
  }
}
