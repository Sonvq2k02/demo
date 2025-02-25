import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  factory Book({
    int? id,
    String? title,
    String? subTitle,
    String? author,
    String? image,
    int? views,
    String? datePublished,
    String? dateUpdated,
    int? chapterCount,
    String? latestChapterDate,
    int? commentsCount,
    String? content,
    String? category,
    String? status,
  }) = _Book;

  // JSON serialization/deserialization
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  static var empty = Book(
    id: -1,
    title: "Không có tiêu đề",
    subTitle: "Không có mô tả",
    author: "Không rõ",
    image: "",
    views: 0,
    datePublished: "",
    dateUpdated: "",
    chapterCount: 0,
    latestChapterDate: "",
    commentsCount: 0,
    content: "",
    category: "",
    status: "",
  );
}
