class Response {
  static Map _data;

  Response(Map data) {
    _data = data;
  }

  Map getData() => _data;
}
