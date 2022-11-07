import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendRequest({required String route, method = "GET", load}) async {
  final url = Uri.http("192.168.1.177:8000", route);

  if (method == "GET") {
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final data = json.decode(response.body);
    return data;
  }

  return Future(() {
    return "Not a valid method";
  });
}
