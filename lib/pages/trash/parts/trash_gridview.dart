import 'package:flutter/material.dart';

class TrashGridview extends StatelessWidget {
  const TrashGridview({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> texts = ['Pozulan kategoriyalar', 'Pozulan Sowda Merkezleri'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 8,
          mainAxisExtent: 310,
        ),
        itemCount: texts.length,
        itemBuilder: (context, index) {
          return Text(texts[index]);
        },
      ),
    );
  }
}
