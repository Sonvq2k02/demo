import 'package:demo_app/ui/list/accesories_list.dart';
import 'package:demo_app/ui/list/pants_list.dart';
import 'package:demo_app/ui/list/shoes_list.dart';
import 'package:demo_app/ui/list/sweaters_list.dart';
import 'package:demo_app/ui/list/tops_list.dart';
import 'package:demo_app/ui/list/underwear_list.dart';
import 'package:demo_app/ui/main/productdateil_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.handleChangeScreen,
  });
  final void Function(int) handleChangeScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.zero,
          child: Image.asset(
            "assets/image/Daksde2.png",
            width: 189,
            height: 59,
            fit: BoxFit.contain,
          ),
        ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New arrivals",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildNewArrivalsSection(),
            const SizedBox(height: 20),
            const Text(
              "Vans Venice collection",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
                child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailPage(),
                  ),
                );
              },
              child:
                  _buildVeniceCollection("assets/image/venice_collection.png"),
            )),
            const SizedBox(height: 20),
            const Text(
              "Shop by category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  _buildCategory("assets/image/Frame 1.png"),
                  _buildCategory("assets/image/Frame 2.png"),
                  _buildCategory("assets/image/Frame 3.png"),
                  _buildCategory("assets/image/Frame 4.png"),
                  _buildCategory("assets/image/Frame 5.png"),
                  _buildCategory("assets/image/Frame 6.png"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Best Sellers",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildNewArrivalsSection(),
            const SizedBox(height: 20),
            const Text(
              "Vans Wayvee drop",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: _buildVeniceCollection("assets/image/Frame 7.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String imagePath) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildNewArrivalsSection() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildNewArrivalItem("assets/image/Item1.png"),
          _buildNewArrivalItem("assets/image/Item2.png"),
          _buildNewArrivalItem("assets/image/Item3.png"),
          _buildNewArrivalItem("assets/image/Item4.png"),
          _buildNewArrivalItem("assets/image/Item5.png"),
        ],
      ),
    );
  }

  Widget _buildNewArrivalItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 200,
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Bo góc cho hình ảnh
          child: Image.asset(
            imagePath,
            height: 151,
            width: 151,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildVeniceCollection(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBestSellersSection() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildNewArrivalItem("assets/image/Item1.png"),
          _buildNewArrivalItem("assets/image/Item2.png"),
          _buildNewArrivalItem("assets/image/Item3.png"),
          _buildNewArrivalItem("assets/image/Item4.png"),
          _buildNewArrivalItem("assets/image/Item5.png"),
        ],
      ),
    );
  }
}
