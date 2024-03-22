import 'package:dio/dio.dart';

class HTTPservice {
  static final HTTPservice _singleton = HTTPservice._internal();
  final _dio = Dio();
  factory HTTPservice() {
    return _singleton;
  }
  HTTPservice._internal() {
    setup();
  }
  Future<void> setup({String? bearerToken}) async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final options = BaseOptions(
      baseUrl: 'https://api.github.com/',
      headers: headers,
    );
    _dio.options = options;
  }
}
