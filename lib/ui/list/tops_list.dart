import 'package:demo_app/ui/list/accesories_list.dart';
import 'package:demo_app/ui/list/pants_list.dart';
import 'package:demo_app/ui/list/shoes_list.dart';
import 'package:demo_app/ui/list/sweaters_list.dart';
import 'package:demo_app/ui/list/underwear_list.dart';
import 'package:flutter/material.dart';

class TopsList extends StatelessWidget {
  const TopsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Tops",
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
    );
  }
}
