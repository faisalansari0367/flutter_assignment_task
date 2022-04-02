import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiMethods {
  static const domain = 'flutter-intern.cupidknot.com';

  static Future<http.Response> post(String endpoint, {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    final url = Uri.http(domain, '/api/$endpoint');
    log(url.toString());
    final result = await http.post(url, body: body, headers: headers);

    log(result.body);
    return result;
  }
}
