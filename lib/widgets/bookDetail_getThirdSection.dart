import 'package:flutter/material.dart';

class BookdetailGetthirdsection extends StatefulWidget {
  const BookdetailGetthirdsection({super.key});

  @override
  State<BookdetailGetthirdsection> createState() =>
      _BookdetailGetthirdsectionState();
}

class _BookdetailGetthirdsectionState extends State<BookdetailGetthirdsection>
    with TickerProviderStateMixin {
  bool _isExpanded = false; // Biến trạng thái xem thêm

  @override
  Widget build(BuildContext context) {
    String longText = '''
Flutter transforms the development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded experiences from a single codebase.
Fast
Flutter code compiles to ARM or Intel machine code as well as JavaScript, for fast performance on any device.
    ''';

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
              longText,
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
