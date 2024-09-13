import 'package:flutter/material.dart';

class AddOrUpdateCategoryPage extends StatelessWidget {
  const AddOrUpdateCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(
        child: Text('Add or update category'),
      ),
    );
  }
}
