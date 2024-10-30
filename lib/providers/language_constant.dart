List<Language> languageList = [
  Language(),
  Khmer(),
];


class Language{
  String get home => "Home";
  String get search => "Search";
  String get information => "Information";
  String get darkMode => "To Dark Mode";
  String get lighMode => "To Light Mode";
  String get systemMode => "To System Mode";
  String get profile => "Profile";
  String get toKhmer => "ប្តូរទៅភាសាខ្មែរ";
  String get toEnglish => "Change To English";
  String get appName => "Cat Gallery App";
}

class Khmer implements Language{
  String get appName => "កម្មវិធីវិចិត្រសាលឆ្មា";
  String get home => "ទំព័រដើម";
  String get search => "ស្វែងរក";
  String get information => "ព័ត៍មាន";
  String get darkMode => "ប្តរទៅងងឹត";
  String get lighMode => "ប្តរទៅភ្លឺ";
  String get systemMode => "ប្តរតាមប្រព័ន្ធ";
  String get profile => "ខ្ញុំ";
  String get toKhmer => "ប្តូរទៅភាសាខ្មែរ";
  String get toEnglish => "Change To English";
}




