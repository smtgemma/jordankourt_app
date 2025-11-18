import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'de_DE': deDE,
    'fr_FR': frFR,
    'el_GR': elGR,
  };
}

// English
final Map<String, String> enUS = {
  'app_title': 'My App',
  'login': 'Login',
  'signup': 'Sign Up',
  'welcome': 'Welcome',
};

// German (Deutsch)
final Map<String, String> deDE = {
  'app_title': 'Meine App',
  'login': 'Anmelden',
  'signup': 'Registrieren',
  'welcome': 'Willkommen',
};

// French (Français)
final Map<String, String> frFR = {
  'app_title': 'Mon Application',
  'login': 'Connexion',
  'signup': 'S’inscrire',
  'welcome': 'Bienvenue',
};

// Greek (Ελληνικά)
final Map<String, String> elGR = {
  'app_title': 'Η Εφαρμογή Μου',
  'login': 'Σύνδεση',
  'signup': 'Εγγραφή',
  'welcome': 'Καλώς ήρθες',
};
