import 'package:flutter/material.dart';
import 'package:iratus/l10n/l10n.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        radius: 35,
        child: Text(flag, style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
