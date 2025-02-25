import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/book.dart';
import '../../models/chapter.dart';
import '../../models/services/books_api_service.dart';

class BookNotifier extends StateNotifier<List<Book>> {
  BookNotifier() : super([]) {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final books = await ApiService().fetchBooks();
    if (state.isEmpty) {
      state = books;
    }
  }

  void addBook(Book newBook) {
    state = [...state, newBook];
  }
}

final bookProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  return BookNotifier();
});

List<Chapter> generateChapters(int count) {
  return List.generate(count, (index) {
    return Chapter(
      title: "Chương ${index + 1}",
      date:
          "2024-01-${(index + 1).toString().padLeft(2, '0')}", // Tạo ngày giả lập
    );
  });
}
