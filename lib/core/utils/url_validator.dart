class Validator {
  bool validateUrl(String potentialUrl) {
    return Uri.parse(potentialUrl).isAbsolute;
  }
}
