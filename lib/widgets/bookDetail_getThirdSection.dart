import 'package:flutter/material.dart';
import '../models/book.dart'; // Import model Book

class BookdetailGetthirdsection extends StatefulWidget {
  final Book book;
  const BookdetailGetthirdsection({super.key, required this.book});

  @override
  State<BookdetailGetthirdsection> createState() =>
      _BookdetailGetthirdsectionState();
}

class _BookdetailGetthirdsectionState extends State<BookdetailGetthirdsection>
    with TickerProviderStateMixin {
  bool _isExpanded = false; // Biến trạng thái xem thêm

  @override
  Widget build(BuildContext context) {
    String content = widget.book.content ?? 'Nội dung chưa được cập nhật.';

    return Container(
      // color: Colors.red,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AnimatedSize cho phép thay đổi kích thước văn bản mượt mà
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Text(
              content,
              maxLines:
                  _isExpanded ? null : 3, // Giới hạn 3 dòng khi chưa mở rộng
              overflow: _isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis, // Cắt bớt văn bản nếu chưa mở rộng
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded =
                    !_isExpanded; // Thay đổi trạng thái khi nhấn vào "Xem thêm"
              });
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                _isExpanded ? 'Thu gọn' : 'Xem thêm',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
