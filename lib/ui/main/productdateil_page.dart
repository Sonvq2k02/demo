import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 622,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/backgroundImage.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 622,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/Rectangle 14.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // AppBar Icons
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                const Positioned(
                  bottom: 16.0, // Adjust this to add some space from the bottom
                  left: 30.0, // Adjust this to change the horizontal position
                  right:
                      16.0, // Optional, used to align text with padding on the right side
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vans Venice collection",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Authentic and sturdy skate apparel with a uniquely L.A aesthetic. Bold, hardy and ready to skate.",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // Hướng bóng đổ
                  ),
                ],
              ),
              //Nội dung

              child: Row(
                children: [
                  //bên hình
                  Container(
                    child: _buildImageProduct("assets/image/Item1.png"),
                  ),
                  const SizedBox(width: 16),
                  //bên nộ dung
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextTitle(
                          "North Face Windbreaker",
                        ),
                        const SizedBox(height: 8),
                        _buildTextBody(
                          "Composition - 100% Polyester - a very strong synthetic fiber that boasts high heat resistance and excellent odor absorption.",
                        ),
                        const SizedBox(width: 16),
                        // Giá sản phẩm
                        const Text(
                          "20000đ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // Hướng bóng đổ
                  ),
                ],
              ),
              //Nội dung

              child: Row(
                children: [
                  //bên hình
                  Container(
                    child: _buildImageProduct("assets/image/Item1.png"),
                  ),
                  const SizedBox(width: 16),
                  //bên nộ dung
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextTitle(
                          "North Face Windbreaker",
                        ),
                        const SizedBox(height: 8),
                        _buildTextBody(
                          "Composition - 100% Polyester - a very strong synthetic fiber that boasts high heat resistance and excellent odor absorption.",
                        ),
                        const SizedBox(width: 16),
                        // Giá sản phẩm
                        const Text(
                          "20000đ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // Hướng bóng đổ
                  ),
                ],
              ),
              //Nội dung

              child: Row(
                children: [
                  //bên hình
                  Container(
                    child: _buildImageProduct("assets/image/Item1.png"),
                  ),
                  const SizedBox(width: 16),
                  //bên nộ dung
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextTitle(
                          "North Face Windbreaker",
                        ),
                        const SizedBox(height: 8),
                        _buildTextBody(
                          "Composition - 100% Polyester - a very strong synthetic fiber that boasts high heat resistance and excellent odor absorption.",
                        ),
                        const SizedBox(width: 16),
                        // Giá sản phẩm
                        const Text(
                          "20000đ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3), // Hướng bóng đổ
                  ),
                ],
              ),
              //Nội dung
              child: Row(
                children: [
                  //bên hình
                  Container(
                    child: _buildImageProduct("assets/image/Item2.png"),
                  ),
                  const SizedBox(width: 16),
                  //bên nộ dung
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildTextTitle("Coach bomber"),

                        const SizedBox(height: 8),
                        _buildTextBody(
                          "Heavy duty, water resistant bomber jacket. Neoprene and polyester construction with wool lining.",
                        ),
                        const SizedBox(width: 16),
                        // Giá sản phẩm
                        const Text(
                          r"$600",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageProduct(String imagePath) {
    return Container(
      width: 123,
      height: 123,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTextTitle(String textTitle) {
    return Text(
      textTitle,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextBody(String textBody) {
    return Text(
      textBody,
      style: const TextStyle(
        fontSize: 13,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
