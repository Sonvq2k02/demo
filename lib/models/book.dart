class Book {
  final int id; // ID sách
  final String title; // Tiêu đề
  final String subTitle; // Phụ đề
  final String author; // Tác giả
  final String image; // URL hình ảnh
  final int views; // Số lượt xem
  final String datePublished; // Ngày xuất bản
  final String dateUpdated; // Ngày cập nhật
  final int chapterCount; // Số chương
  final String latestChapterDate; // Ngày chương mới nhất
  final int commentsCount; // Số lượt bình luận
  final String content; // Nội dung mô tả
  final String category; // Thể loại
  final String status; // Trạng thái (Hoàn thành hoặc Chưa hoàn thành)

  Book({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.author,
    required this.image,
    required this.views,
    required this.datePublished,
    required this.dateUpdated,
    required this.chapterCount,
    required this.latestChapterDate,
    required this.commentsCount,
    required this.content,
    required this.category,
    required this.status,
  });

  // Phương thức từ JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      subTitle: json['sub_title'],
      author: json['author'],
      image: json['image'],
      views: json['views'],
      datePublished: json['date_published'],
      dateUpdated: json['date_updated'],
      chapterCount: json['chapter_count'],
      latestChapterDate: json['latest_chapter_date'],
      commentsCount: json['comments_count'],
      content: json['content'],
      category: json['category'],
      status: json['status'], // Thêm trạng thái
    );
  }

  // Phương thức chuyển sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sub_title': subTitle,
      'author': author,
      'image': image,
      'views': views,
      'date_published': datePublished,
      'date_updated': dateUpdated,
      'chapter_count': chapterCount,
      'latest_chapter_date': latestChapterDate,
      'comments_count': commentsCount,
      'content': content,
      'category': category,
      'status': status, // Thêm trạng thái
    };
  }
}
