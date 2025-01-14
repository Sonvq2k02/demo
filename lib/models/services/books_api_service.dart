import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<Book> fetchBookById(int id) async {
    try {
      final response = await dio.get(
        'https://105a7394-9e19-4b48-9270-6fa500fe4b4a.mock.pstmn.io/books',
      );

      if (response.statusCode == 200) {
        // Kiểm tra nếu response trả về danh sách
        if (response.data is List<dynamic>) {
          // Tìm sách có ID trùng khớp
          final bookData = (response.data as List<dynamic>)
              .cast<Map<String, dynamic>>()
              .firstWhere((book) => book['id'] == id, orElse: () => {});

          if (bookData.isNotEmpty) {
            return Book.fromJson(bookData);
          } else {
            throw Exception('Book with ID $id not found');
          }
        } else {
          throw Exception('Unexpected data format: ${response.data}');
        }
      } else {
        throw Exception('Failed to load book (status: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Error fetching book by ID: $e');
    }
  }
}

class BookListNotifier extends StateNotifier<List<Book>> {
  BookListNotifier() : super([]);

  final ApiService apiService = ApiService();

  Future<void> fetchBooks() async {
    try {
      final books = await apiService.fetchBooks();
      if (books.isEmpty) {
        throw Exception('No books found');
      }
      state = books;
    } catch (e) {
      print('Failed to fetch books: $e');
      rethrow; // Bắn lại lỗi nếu cần xử lý bên trên
    }
  }

  void addBook(Book book) {
    state = [...state, book]; // Thêm sách mới
  }

  void removeBook(int bookId) {
    state = state.where((book) => book.id != bookId).toList(); // Xóa sách
  }
}
