import 'package:dio/dio.dart';

import '../book.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<Book>> fetchBooks() async {
    try {
      final response = await dio.get(
          'https://105a7394-9e19-4b48-9270-6fa500fe4b4a.mock.pstmn.io/books');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => Book.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }
}
