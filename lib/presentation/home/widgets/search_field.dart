import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 16,
          left: 16
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)
          ),
          prefixIcon: const Icon(Icons.search,),
          hintText: "Search"
        ),
      ),
    );
  }
}
