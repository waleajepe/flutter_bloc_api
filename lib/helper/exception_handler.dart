import 'dart:async';
import 'dart:io';

String handleExceptionWithMessage(dynamic error) {
  if (error is SocketException) {
    return "No internet. Check your internet connection";
  } else if (error is TimeoutException) {
    return "The request timed out";
  } else {
    return "An error occurred, please try again";
  }
}
