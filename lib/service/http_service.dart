import 'package:http/http.dart' as http;

class HttpService {
  static const baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

  static Future<http.Response> getResponse(endPoint) async {
    http.Response response;
    try {
      response = await http.get(Uri.parse("$baseUrl$endPoint"));
    } catch (e) {
      rethrow;
    }
    return response;
  }
}
