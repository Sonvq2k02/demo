import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Image.asset(
        //   "assets/image/Daksde.png",
        //   width: 160,
        //   height: 60,
        //   color: Colors.black,
        //   fit: BoxFit.contain,
        // ),
        Text(
          "Logo",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          //backgroundImage: AssetImage("  "),
          radius: 20,
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 24,
          ),
        ),
      ],
    );
  }
}
