import 'package:flutter/material.dart';

class CategoriesPageAppBar extends StatelessWidget {
  const CategoriesPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
