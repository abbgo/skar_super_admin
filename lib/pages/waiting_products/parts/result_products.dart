import 'package:flutter/material.dart';

class ResultProducts extends StatelessWidget {
  const ResultProducts({super.key, required this.cratedStatus});

  final int cratedStatus;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Result Products'));
  }
}
