import 'package:flutter_app/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class RequestConfig {
  static String url = "192.168.1.12:8000";
  Map<String, String> headers = {"Content-Type": "application/json"};

  Map<String, String> getHeaders(context) {
    final token = Provider.of<Auth>(context, listen: false).getToken;

    if (token != null) {
      return {
        ...headers,
        "Authorization": "Bearer $token",
      };
    }

    return headers;
  }
}
