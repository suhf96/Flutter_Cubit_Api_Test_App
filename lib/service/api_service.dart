import 'package:cubit_api_request_test/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response? response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return response;
    } on Exception catch (e) {
      debugPrint('Error asd: $e');
    }
  }
}
