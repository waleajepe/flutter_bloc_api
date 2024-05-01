import 'package:intl/intl.dart';

class TextFormatter{

  static final formatCurrency = NumberFormat.currency(locale: "en_US", symbol: "");
  static String reduceTextLength(String text, int length) {
    if (text.length > length) {
      return "${text.substring(0, length - 1)}...";
    } else {
      return text;
    }
  }
}