import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('en'); // Default language

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners(); // Notify widgets to rebuild with the new locale
  }

  // void clearLocale() {
  //   _locale = Locale('en'); // Reset to default
  //   notifyListeners();
  // }
}
