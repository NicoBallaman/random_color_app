import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class I18n {
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'AR'),
  ];

  final Locale _locale;
  Map<String, dynamic> _sentences = {};

  I18n(this._locale);

  static I18n of(BuildContext context) {
    final I18n? result = Localizations.of<I18n>(context, I18n);
    if (result == null) {
      throw Exception('I18n not found');
    }

    return result;
  }

  Future<I18n> load() async {
    final data = await _loadData();
    final Map<String, dynamic> result = json.decode(data);

    _sentences = {};
    result.forEach((String key, dynamic value) {
      if (value is Map) {
        _sentences[key] = value;

        return;
      }
      _sentences[key] = value.toString();
    });

    return I18n(_locale);
  }

  Future<String> _loadData() async {
    final fileName = '${_locale.languageCode}${_locale.countryCode == null ? '' : '-${_locale.countryCode}'}';

    return rootBundle.loadString('assets/i18n/$fileName.json');
  }

  String translate(String key, {String? defaultValue}) {
    defaultValue = defaultValue ?? key;
    final keySplit = key.split('.');
    final text = keySplit.length == 1 ? _sentences[keySplit.first] : _getComposeTranslation(keySplit);

    return text ?? defaultValue;
  }

  String? _getComposeTranslation(List<String> keySplit) {
    return _sentences[keySplit.first] != null ? _sentences[keySplit.first][keySplit[1]] : null;
  }

  String toUpperCase(String key) {
    return translate(key).toUpperCase();
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<I18n> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return I18n.supportedLocales.map((e) => e.languageCode).contains(locale.languageCode);
  }

  @override
  Future<I18n> load(Locale locale) async {
    final localizations = I18n(locale);
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
