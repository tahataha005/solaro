import 'package:flutter_app/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class RequestConfig {
  static String url = "172.20.10.2:8000";

  Map<String, String> getHeaders(context) {
    final token = Provider.of<Auth>(context).getToken;
    final Map<String, String> headers;
  }
}
