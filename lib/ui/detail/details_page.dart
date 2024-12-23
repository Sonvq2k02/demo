import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu được định nghĩa trực tiếp trong widget
    const imageUrl = 'assets/image/Item1.png';
    const title = 'Navy KROOKED sweater';
    const description =
        'Hand-woven 100% cotton KROOKED rugby jersey in baby blue/navy retro colour way.';
    const price = 1750.0;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hình ảnh sản phẩm
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),

                // Tiêu đề sản phẩm
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Mô tả sản phẩm
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),

                // Giá và các nút chọn size
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Giá sản phẩm
                    Text(
                      'R $price',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Icon giỏ hàng
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Xử lý thêm vào giỏ hàng
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Nút chọn size
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizeButton(size: 'S'),
                    SizedBox(width: 8),
                    SizeButton(size: 'M'),
                    SizedBox(width: 8),
                    SizeButton(size: 'L'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  final String size;

  const SizeButton({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      onPressed: () {
        // Xử lý khi chọn size
      },
      child: Text(
        size,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
