import 'package:flutter/material.dart';

class ShopsTable extends StatelessWidget {
  const ShopsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Ady (tm)'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Ady (ru)'),
            ),
          ],
        ),
      ],
    );
  }
}
