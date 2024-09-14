import 'package:flutter/material.dart';

class AddOrUpdateCategoryButton extends StatelessWidget {
  const AddOrUpdateCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {},
          child: const Text('Gos'),
        ),
      ),
    );
  }
}
