import 'dart:io';

class ErrorHandler {
  static String getErrorMessage(Object e) {
    if (e is SocketException) {
      return "Please check you internet connection and try again";
    }
    return e.toString();
  }
}
