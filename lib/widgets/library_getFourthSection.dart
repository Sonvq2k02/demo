import 'package:flutter/material.dart';

class LibraryGetfourthsection extends StatefulWidget {
  const LibraryGetfourthsection({super.key});

  @override
  State<LibraryGetfourthsection> createState() =>
      _LibraryGetfourthsectionState();
}

class _LibraryGetfourthsectionState extends State<LibraryGetfourthsection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      height: 400,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2, // Số cột
          crossAxisSpacing: 10, // Khoảng cách ngang
          mainAxisSpacing: 10, // Khoảng cách dọc
          children: List.generate(
            5, // Số lượng phần tử (6 sản phẩm)
            (index) => Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child:
                    // Hình ảnh (màu xanh)
                    Container(
                  width: double.infinity,
                  height: 245,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
