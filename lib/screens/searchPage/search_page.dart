import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 77, left: 37, right: 37),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
