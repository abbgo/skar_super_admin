import 'package:flutter/material.dart';

class PaginationButtons extends StatelessWidget {
  const PaginationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Sahypa: 1'),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
      ],
    );
  }
}
