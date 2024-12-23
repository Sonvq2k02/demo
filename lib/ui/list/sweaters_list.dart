import 'package:demo_app/ui/list/accesories_list.dart';
import 'package:demo_app/ui/list/pants_list.dart';
import 'package:demo_app/ui/list/shoes_list.dart';
import 'package:demo_app/ui/list/tops_list.dart';
import 'package:demo_app/ui/list/underwear_list.dart';
import 'package:flutter/material.dart';

class SweatersList extends StatelessWidget {
  const SweatersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Sweaters",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Tops',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TopsList()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Sweaters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SweatersList()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Pants',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PantsList()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Shoes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoesList()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Underwear',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UnderwearList()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Accessories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccesoriesList()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: <Widget>[
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
                      overflow:
                          TextOverflow.ellipsis, // Thêm "..." nếu nội dung dài
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
                      overflow:
                          TextOverflow.ellipsis, // Thêm "..." nếu nội dung dài
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
      ]),
    );
  }
}
