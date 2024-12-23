import 'package:demo_app/ui/cart/payment_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Your cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
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
                    width: 123,
                    height: 123,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/Item1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  //bên nộ dung
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "North Face Windbreaker",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Composition - 100% Polyester - a very strong synthetic fiber that boasts high heat resistance and excellent odor absorption.",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          maxLines: 3, // Giới hạn dòng
                          overflow: TextOverflow
                              .ellipsis, // Thêm "..." nếu nội dung dài
                        ),
                        SizedBox(width: 16),
                        // Giá sản phẩm
                        Text(
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
                    width: 123,
                    height: 123,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/Item1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  //bên nộ dung
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Coach bomber",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Heavy duty, water resistant bomber jacket. Neoprene and polyester construction with wool lining.",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          maxLines: 3, // Giới hạn dòng
                          overflow: TextOverflow
                              .ellipsis, // Thêm "..." nếu nội dung dài
                        ),
                        SizedBox(width: 16),
                        // Giá sản phẩm
                        Text(
                          "price",
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
            const SizedBox(height: 50),
            const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "1 x Vans Eco Theory",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "R1099",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
            const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "1 x North Face Windbreaker",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "R1099",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.green,
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
            ),
            const SizedBox(height: 16),
            const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Total:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "R1099",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
            const SizedBox(height: 170),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        ));
  }
}
