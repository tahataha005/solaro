Future sendRequest({required String route, method = "GET", load}) async {
  final url = Uri.http("192.168.1.177:8000", route);

  return Future(() {
    return "Not a valid method";
  });
}
