class AppStrings {
  AppStrings._privateConstructor();
  static final AppStrings _instance = AppStrings._privateConstructor();

  static AppStrings get instance {
    return _instance;
  }

  static const String clipboardCopy = "Copied to ClipBoard";
  static const String validationError = "Please enter a valid url";
  static const String badRequest = "Bad Request";
  static const String internalServer = "Internal Server Error";
  static const String noInternet = "Couldn't connect to the internet";
}
