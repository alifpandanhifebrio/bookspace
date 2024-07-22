class CRegex {
  CRegex._internal();
  static bool isAlphabetOnly(String? s) => _hasMatch(s, alphabetOnly);
  static bool isAlphabetOnlyWoSpace(String? s) => _hasMatch(s, alphabetOnlyWoSpace);
  static bool isAlphaNumericOnly(String? s) => _hasMatch(s, alphaNumericOnly);
  static bool isNumericOnly(String? s) => _hasMatch(s, uint);
  static bool isOwaspPassword(String? s) => _hasMatch(s, owaspPassword);
  static bool hasUppercase(String? s) => _hasMatch(s, uppercase);
  static bool hasLowerCase(String? s) => _hasMatch(s, lowercase);
  static bool hasNumric(String? s) => _hasMatch(s, numeric);
  static bool isValidEmail(String? s) => _hasMatch(s, email);
  static bool isValidUsername(String? s) => _hasMatch(s, username);

  static String uint = r'[0-9]';
  static String alphabetOnly = r'^[a-zA-Z\s]+$';
  static String uppercase = r'^(?=.*[A-Z])';
  static String lowercase = r'^(?=.*?[a-z])';
  static String numeric = r'^(?=.*?[0-9])';
  static String alphabetOnlyWoSpace = r'[a-zA-Z]+$';
  static String alphaNumericOnly = r'[a-zA-Z0-9 ]';
  static String alphaNumericEmailOnly = r'[a-zA-Z0-9@.]';
  static String alphaNumericEmailSpaceOnly = r'[a-zA-Z0-9@. ]';
  static String alphaNumericSymbolOnly = r'''[a-zA-Z0-9!@#$%^&*()-_+=~{}:";',./|\\\[\]<>? ]''';
  static String owaspPassword = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-.]).{8,}$';
  static String email = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String twoDigitDouble = r'^\d+\,?\d{0,2}';
  static String oneDigitDouble = r'^\d+\,?\d{0,1}';
  static String threeDigitDouble = r'^\d+\,?\d{0,3}';
  static String username = r'[a-zA-Z0-9]';
  static String phoneNumberID = r'^(0|8)\d{0,14}$';

  static bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
