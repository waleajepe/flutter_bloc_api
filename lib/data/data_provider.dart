import 'package:http/http.dart' as http;

class DataProvider {
  static Future<http.Response> getRequest({required String endpoint}) async {
    try {
      final response = await http.get(Uri.parse(endpoint));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
